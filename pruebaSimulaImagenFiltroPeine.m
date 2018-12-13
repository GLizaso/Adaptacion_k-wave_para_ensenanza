%Prueba de uso de la funci�n simulaImagen256 con k-wave
%Las im�genes deben ser archivos bmp de 256 colores
%Dimensiones convenientes para eficiencia de c�lculo son 128, 256, 512
%Referencia "Ense�anza de Ac�stica F�sica con Simulaciones en k-wave"
%enviado para publicaci�n a revista Elektor
% Jorge Petrosino, Lucas Landini, Georgina Lizaso, Ian Kuri, Ianina Canalis
%
nombreArchivoImagen='FiltroPeine.bmp';
escala=1e-2; % m�nimo dx grilla en metros
duracion=0.7e-2; % duraci�n de la simulaci�n en segundos
registraVideo=false;
c0=344; % velocidad del sonido
fuente.tipo='impulso';
fuente.amplitud=10;
fuente.modo='dirichlet';
[datos_sensor, t, dt, ecuacion, lx, ly] = simulaImagen256(nombreArchivoImagen, escala, duracion, registraVideo,c0,fuente);


%Gr�ficos de resultados
subplot(2,1,1)
plot(t,ecuacion); grid on
title('fuentes'); xlabel('t [s]'); ylabel('presi�n [Pa]')
subplot(2,1,2)
plot(t,datos_sensor); grid on
title('registros'); xlabel('t [s]'); ylabel('presi�n [Pa]')
legend('1','2','Location','NorthWest')
%Espectro de las respuestas
figure
H1=fft(datos_sensor(1,:));
H2=fft(datos_sensor(2,:));
f=(0:length(t)-1)/length(t)/dt; % la frecuencia de muestreo de c�mputo es 1/dt
plot(f,20*log10(abs(H1)),f,20*log10(abs(H2)))
axis([0 15000 -inf inf]) % k-wave reporta en la simulaci�n => maximum supported frequency: 17.2kHz
grid on