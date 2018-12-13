function [ fuente ] = fuenteNciclos(f0,n,dt,duracion)
%[ fuente ] = fuenteNciclos( f0,n,duracion)
%   Genera una fuente de frecuencia f0, n ciclos y duración especificada
%   Completa la duración con ceros al final
%   Si la cantidad de n ciclos es mayor que la duración entrega un mensaje
%
% Ejemplo de uso típico
% source.p = fuenteNciclos(800,4,kgrid.dt,kgrid.t_array(end));
%

T0=1/f0; tciclos=(0:dt:n*T0-dt);
fuente=zeros(1,round(duracion/dt)+1);
fuente(1:length(tciclos+1))=sin(2*pi*f0*tciclos);

if tciclos(end)>duracion
    display(' ')
    display('Los ciclos de la fuente superan el tiempo de simulación');
    display(' ')
end
end

