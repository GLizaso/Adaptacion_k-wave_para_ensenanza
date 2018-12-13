%Prueba de uso de la función simulaImagen256 con k-wave
%Las imágenes deben ser archivos bmp de 256 colores
%Dimensiones convenientes para eficiencia de cálculo son 128, 256, 512
%Referencia "Enseñanza de Acústica Física con Simulaciones en k-wave"
%enviado para publicación a revista Elektron
% Jorge Petrosino, Lucas Landini, Georgina Lizaso, Ian Kuri, Ianina Canalis
%
nombreArchivoImagen='DifraccionObstaculo.bmp';
escala=1e-3; % mínimo dx grilla en metros
duracion=2e-3; % duración de la simulación en segundos
registraVideo=false;
c0=344; % velocidad del sonido
fuente.tipo='0.2*sin(2*pi*3000*t)+0.2*sin(2*pi*30000*t)';
fuente.modo='additive';
[datos_sensor, t, dt, ecuacion, lx, ly] = simulaImagen256(nombreArchivoImagen, escala, duracion, registraVideo,c0,fuente);


%Gráficos de resultados
subplot(2,1,1)
plot(t,ecuacion); grid on
title('fuentes'); xlabel('t [s]'); ylabel('presión [Pa]')
subplot(2,1,2)
plot(t,datos_sensor); grid on
title('registros'); xlabel('t [s]'); ylabel('presión [Pa]')
legend('1','2','Location','NorthWest')

