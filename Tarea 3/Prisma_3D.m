clear 
close all
clf

%%Ejes
hold on
line([0 2], [0 0], [0 0], "Color",'red','LineWidth',3);
line([0 0], [0 2], [0 0], "Color",'green','LineWidth',3);
line([0 0], [0 0], [0 2], "Color",'red','LineWidth',3);
view(3)
   
%%Localización de cada punto
Punto1 = [0 0 0]';
Punto2 = [1 0 0]';
Punto3 = [1 0.6 0]';
Punto4 = [0 0.6 0]';

Punto5 = [0 0 0.8]';
Punto6 = [1 0 0.8]';
Punto7 = [1 0.6 0.8]';
Punto8 = [0 0.6 0.8]';

%%Dibujando puntos
 scatter3(Punto1(1), Punto1(2), Punto1(3), 100, 'filled',...
     'MarkerFaceColor', 'blue');

scatter3(Punto2(1), Punto2(2), Punto2(3), 100, 'filled',...
     'MarkerFaceColor', 'blue');
scatter3(Punto3(1), Punto3(2), Punto3(3), 100, 'filled',...
     'MarkerFaceColor', 'blue');
scatter3(Punto4(1), Punto4(2), Punto4(3), 100, 'filled',...
     'MarkerFaceColor', 'blue');
scatter3(Punto5(1), Punto5(2), Punto5(3), 100, 'filled',...
     'MarkerFaceColor', 'blue');
scatter3(Punto6(1), Punto6(2), Punto6(3), 100, 'filled',...
     'MarkerFaceColor', 'blue');
scatter3(Punto7(1), Punto7(2), Punto7(3), 100, 'filled',...
     'MarkerFaceColor', 'blue');
scatter3(Punto8(1), Punto8(2), Punto8(3), 100, 'filled',...
     'MarkerFaceColor', 'blue');

%%Dibujando líneas
%%Cara de abajo
line([Punto1(1) Punto2(1)], [Punto1(2) Punto2(2)], [Punto1(3) Punto2(3)],...
    "Color", "black","LineWidth",2);
line([Punto2(1) Punto3(1)], [Punto2(2) Punto3(2)], [Punto2(3) Punto3(3)],...
    "Color", "black","LineWidth",2);
line([Punto3(1) Punto4(1)], [Punto3(2) Punto4(2)], [Punto3(3) Punto4(3)],...
    "Color", "black","LineWidth",2);
line([Punto4(1) Punto1(1)], [Punto4(2) Punto1(2)], [Punto4(3) Punto1(3)],...
    "Color", "black","LineWidth",2);

%%Cara de arriba
line([Punto5(1) Punto6(1)], [Punto5(2) Punto6(2)], [Punto5(3) Punto6(3)],...
    "Color", "black","LineWidth",2);
line([Punto6(1) Punto7(1)], [Punto6(2) Punto7(2)], [Punto6(3) Punto7(3)],...
    "Color", "black","LineWidth",2);
line([Punto7(1) Punto8(1)], [Punto7(2) Punto8(2)], [Punto7(3) Punto8(3)],...
    "Color", "black","LineWidth",2);
line([Punto8(1) Punto5(1)], [Punto8(2) Punto5(2)], [Punto8(3) Punto5(3)],...
    "Color", "black","LineWidth",2);

%%Verticales
line([Punto1(1) Punto5(1)], [Punto1(2) Punto5(2)], [Punto1(3) Punto5(3)],...
    "Color", "black","LineWidth",2);
line([Punto2(1) Punto6(1)], [Punto2(2) Punto6(2)], [Punto2(3) Punto6(3)],...
    "Color", "black","LineWidth",2);
line([Punto3(1) Punto7(1)], [Punto3(2) Punto7(2)], [Punto3(3) Punto7(3)],...
    "Color", "black","LineWidth",2);
line([Punto4(1) Punto8(1)], [Punto4(2) Punto8(2)], [Punto4(3) Punto8(3)],...
    "Color", "black","LineWidth",2);
