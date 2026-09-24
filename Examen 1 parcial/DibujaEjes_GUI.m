function DibujaEjes_GUI(ax,AxisLenght)

Delta = [-AxisLenght AxisLenght];

line(ax,Delta,[0 0],[0 0],LineWidth=2,Color='r');
line(ax,[0 0],Delta,[0 0],LineWidth=2,Color='g');
line(ax,[0 0],[0 0],Delta,LineWidth=2,Color='b');

hold (ax,'on')
grid (ax, 'on')
view(ax, 45,30) %Establece vista isometrica de la grafica con grados Azimuth

axis (ax, 'equal') %Fija la proporcion del tamanio de los ejes
end