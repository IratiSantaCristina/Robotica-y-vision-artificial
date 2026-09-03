function DibujaEjes(AxisLenght)

Delta = [-AxisLenght AxisLenght];

line(Delta,[0 0],[0 0],LineWidth=2,Color='r');
line([0 0],Delta,[0 0],LineWidth=2,Color='g');
line([0 0],[0 0],Delta,LineWidth=2,Color='b');

hold on
grid on
view(45,30) %Establece vista isometrica de la grafica con grados Azimuth

axis equal %Fija la proporcion del tamanio de los ejes
end
