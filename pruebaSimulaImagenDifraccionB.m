%Prueba de uso de la funci�n simulaImagen256 con k-wave
%Las im�genes deben ser archivos bmp de 256 colores
%Dimensiones convenientes para eficiencia de c�lculo son 128, 256, 512
%Referencia "Ense�anza de Ac�stica F�sica con Simulaciones en k-wave"
%enviado para publicaci�n a revista Elektor
% Jorge Petrosino, Lucas Landini, Georgina Lizaso, Ian Kuri, Ianina Canalis
%
nombreArchivoImagen='DifraccionObstaculo.bmp';
escala=1e-3; % m�nimo dx grilla en metros
duracion=2e-3; % duraci�n de la simulaci�n en segundos
registraVideo=false;
c0=344; % velocidad del sonido
fuente.tipo='0.2*sin(2*pi*3000*t)+0.2*sin(2*pi*30000*t)';
fuente.modo='additive';
[datos_sensor, t, dt, ecuacion, lx, ly] = simulaImagen256(nombreArchivoImagen, escala, duracion, registraVideo,c0,fuente);


%Gr�ficos de resultados
subplot(2,1,1)
plot(t,ecuacion); grid on
title('fuentes'); xlabel('t [s]'); ylabel('presi�n [Pa]')
subplot(2,1,2)
plot(t,datos_sensor); grid on
title('registros'); xlabel('t [s]'); ylabel('presi�n [Pa]')
legend('1','2','Location','NorthWest')

