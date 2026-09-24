function SolucionHomogenea(app, l1, l2, l3,theta1, theta2, theta3, theta4)
        cla(app.UIAxes)
        DibujaEjes_GUI(app.UIAxes, l1+l2+l3);
        hold (app.UIAxes, 'on')

P0 = [0; 0; 0; 1];

%Primera rotación en Z
[R1, ~] = Rotacion3D(0, 0, (theta1-pi/2), P0);

%Giro de los ejes a 90º
[R2, ~]  = Rotacion3D(0, pi/2, 0, P0);
[R3, ~] = Rotacion3D(0, 0, pi/2,P0);

%Primer eslabón
[R4, ~] = Rotacion3D(0, 0, theta2, P0); 
[R5, ~] = Traslacion(l1, 0, 0, P0);

%Segundo eslabón
[R6, ~] = Rotacion3D(0, 0, theta3, P0); 
[R7, ~] = Traslacion(l2, 0, 0, P0);

% Tercer eslabón
[R8, ~] = Rotacion3D(0, 0, theta4, P0); 
[R9, ~] = Traslacion(l3, 0, 0, P0);

P1  = R1*R2*R3*R4*R5*P0;
P2 = R1*R2*R3*R4*R5*R6*R7*P0;
EF = R1*R2*R3*R4*R5*R6*R7*R8*R9*P0;

    scatter3(app.UIAxes, P0(1), P0(2), P0(3), 100, 'filled', 'MarkerFaceColor', 'red');
    scatter3(app.UIAxes, P1(1), P1(2), P1(3), 100, 'filled', 'MarkerFaceColor', 'red');
    scatter3(app.UIAxes, P2(1), P2(2), P2(3), 100, 'filled', 'MarkerFaceColor', 'red');
    scatter3(app.UIAxes, EF(1),      EF(2),    EF(3),     100, 'filled', 'MarkerFaceColor', 'red');

    line(app.UIAxes, [P0(1) P1(1)], [P0(2) P1(2)], [P0(3) P1(3)], 'color', 'black', 'linewidth', 2);
    line(app.UIAxes, [P1(1) P2(1)], [P1(2) P2(2)], [P1(3) P2(3)], 'color', 'black', 'linewidth', 2);
    line(app.UIAxes, [P2(1) EF(1)],     [P2(2) EF(2)],     [P2(3) EF(3)],     'color', 'black', 'linewidth', 2);

    pause(0.05)
end