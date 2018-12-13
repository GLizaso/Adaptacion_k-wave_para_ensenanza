function [ fuente ] = fuenteImpulso(dt,duracion)
%[ fuente ] = fuenteImpulso(dt,duracion)
%   Genera una fuente impulsiva duraci�n especificada
%
% Ejemplo de uso t�pico
% source.p = fuenteImpulso(kgrid.dt,kgrid.t_array(end));
%
t=0:dt:duracion;
fuente=zeros(1,round(duracion/dt)+1);
fuente(1)=1;

end

