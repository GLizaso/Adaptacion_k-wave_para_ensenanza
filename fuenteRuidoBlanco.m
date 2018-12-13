function [ fuente ] = fuenteRuidoBlanco(duracionruido, dt,duraciontotal)
%[ fuente ] = fuenteRuidoBlanco( duracionruido, dt,duraciontotal)
%   Genera un ruido blanco de amplitud 1 de duraci�n especificada
% Ejemplo de uso t�pico
% source.p = fuenteRuidoBlanco(kgrid.t_array(end)/2,
% kgrid.dt,kgrid.t_array(end));
%

fuente=zeros(1,round(duraciontotal/dt)+1);
fuente(1,1:round(duracionruido/dt))=2*(rand(1,round(duracionruido/dt))-0.5);



end
