function [ datos_sensor, t, dt, ecuacion, lx, ly] = simulaImagen256(nombreArchivoImagen, escala, duracion, registraVideo, c0,fuente)
%[datos_sensor, t, dt, fuente, lx, ly] = simulaImagen256(nombreArchivoImagen, escala, duracion, registraVideo,c0,fuente)
%Ver ejemplos de uso en https://github.com/GLizaso/Adaptacion_k-wave_para_ensenanza
%Referencia "Enseñanza de Acústica Física con Simulaciones en k-wave"
%enviado para publicación a revista Elektor
% Jorge Petrosino, Lucas Landini, Georgina Lizaso, Ian Kuri, Ianina Canalis
%
% 
densidad=1.24;
t_final = duracion;       %tiempo total en segundos
imagen =imread(nombreArchivoImagen);
NEGRO=0; VERDE=113; ROJO=79; % colores archivos BMP 24 bits
formato=imfinfo(nombreArchivoImagen);
if formato.BitDepth ~= 8; display('Archivo de imagen no soportado. Utilice BMP 256 colores');return ; end 
if not(strcmp(formato.Format,'bmp')); display('Archivo de imagen no soportado. Utilice BMP 256 colores');return ; end 

CFL=0.4; dx=escala; dy=dx;
Nx = length(imagen(:,1));  Ny = length(imagen(1,:)); 
lx=Nx*dx; ly=Ny*dy;
kgrid = kWaveGrid(Nx, dx, Ny, dy);
              
medium.density=densidad; medium.sound_speed=c0;
kgrid.t_array = makeTime(kgrid, medium.sound_speed, CFL , t_final);
dt=kgrid.dt;
t=kgrid.t_array;

%fuentes (ROJO=79)
source.p_mask=(imagen==ROJO);
source.p_mode=fuente.modo;

tipoFuente=fuente.tipo;
switch tipoFuente
    case 'impulso'
        ecuacion=fuente.amplitud*fuenteImpulso(dt,duracion);
    case 'nCiclos'
        ecuacion=fuente.amplitud*fuenteNciclos(fuente.f0,fuente.n,dt,duracion);
    case 'ruidoBlanco'
        ecuacion=fuente.amplitud*fuenteRuidoBlanco;
    case 'nComponentes'
        ecuacion=fuente.amplitud*fuenteNcomponentes(fuente.f0,fuente.n,dt,duracion);
    otherwise
        eval(['ecuacion =' tipoFuente ';']);
end
ecuacion=ecuacion(1:length(t)); % Por uso de round(), podría no coincidir con k-wave original
source.p=ecuacion;

%paredes (NEGRO=0)
source.u_mask=(imagen==NEGRO);
if (source.u_mask(1,1)==0); source.u_mask(1,1)=1; end %Agrega un punto en la zona PML
source.ux=0*kgrid.t_array;
source.uy=0*kgrid.t_array;
source.u_mode='dirichlet';

%sensores (VERDE=113)
sensor.mask=(imagen==VERDE);

mascaraTotal=imagen<255;
input_args ={'DisplayMask', mascaraTotal, 'RecordMovie',registraVideo,'LogScale', false};
datos_sensor=kspaceFirstOrder2D(kgrid, medium, source, sensor, input_args{:});

end

