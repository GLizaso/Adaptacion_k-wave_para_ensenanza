%Prueba de uso de la función simulaImagen256 con k-wave
%Las imágenes deben ser archivos bmp de 256 colores
%Dimensiones convenientes para eficiencia de cálculo son 128, 256, 512
%Referencia "Enseñanza de Acústica Física con Simulaciones en k-wave"
%enviado para publicación a revista Elektron
% Jorge Petrosino, Lucas Landini, Georgina Lizaso, Ian Kuri, Ianina Canalis
%
nombreArchivoImagen='TuboInfinitoAbierto.bmp';
escala=1e-3; % mínimo dx grilla en metros
duracion=1.2e-3; % duración de la simulación en segundos
registraVideo=false;
c0=344; % velocidad del sonido
fuente.tipo='nCiclos';
fuente.amplitud=0.5; fuente.f0=3000; fuente.n=1; 
fuente.modo='additive';
[datos_sensor, t, dt, ecuacion, lx, ly] = simulaImagen256(nombreArchivoImagen, escala, duracion, registraVideo,c0,fuente);


%Gráficos de resultados
subplot(2,1,1)
plot(t,ecuacion);
title('fuentes'); xlabel('t [s]'); ylabel('presión [Pa]')
subplot(2,1,2)
plot(t,datos_sensor);
title('registros'); xlabel('t [s]'); ylabel('presión [Pa]')
%legend('cerca sin barrera','cerca tras barrera', 'lejos sin barrera','lejos tras barrera')
legend('1','2','Location','SouthWest')
axis([-inf inf -0.5 0.5])
