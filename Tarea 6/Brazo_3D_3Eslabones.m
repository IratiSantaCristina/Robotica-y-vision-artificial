close all
clear
clf

l1 = input("Indica el tamano del primer eslabon [m]: ");
l2 = input("Indica el tamano del segundo eslabon [m]: ");
l3 = input("Indica el tamano del tercer eslabon [m]: ");

DibujaEjes(l1+l2+l3);
view(3)
axis equal

eje_1 = lower(input("Indica el eje de rotacion de la base (x/y/z): ", 's'));
rot_1 = input("Indica el angulo de rotacion de la base [rad]: ");
rot_2 = input("Indica el angulo de rotacion del segundo eslabon [rad]: ");
rot_3 = input("Indica el angulo de rotacion del tercer eslabon [rad]: ");

N = 50;
a1 = linspace(0, rot_1, N);
a2 = linspace(0, rot_2, N);
a3 = linspace(0, rot_3, N);

%En que eje tiene que girar la base
if eje_1 == 'x'
    x1 = a1;   y1 = 0; z1 = 0;
elseif eje_1 == 'y'
    x1 = 0; y1 = a1;   z1 = 0;
elseif eje_1 == 'z'
    x1 = 0; y1 = 0; z1 = a1;
end

for k = 1:N
    clf
    DibujaEjes(l1+l2+l3);
    view(3)
    axis equal
    hold on

    % Primera articulacion
    joint1 = [0 0 0]';
    scatter3(joint1(1), joint1(2), joint1(3), 100, 'filled', 'MarkerFaceColor', 'red');

    % Eslabon 1
    v1 = [l1 0 0 1]';
    p1 = Rotacion3D(x1(k), y1(k), z1(k), v1);
    joint2 = joint1 + p1(1:3);
    scatter3(joint2(1), joint2(2), joint2(3), 100, 'filled', 'MarkerFaceColor', 'red');

    % Eslabon 2 (desde la punta del anterior
    v2 = [l2 0 0 1]';
    p2 = Rotacion3D(x1(k), y1(k), y1(k), Rotacion3D(0, 0, a2(k), v2));
    joint3 = joint2 + p2(1:3);
    scatter3(joint3(1), joint3(2), joint3(3), 100, 'filled', 'MarkerFaceColor', 'red');

    % Eslabon 3
    v3 = [l3 0 0 1]';
    p3 = Rotacion3D(x1(k), y1(k), z1(k), Rotacion3D(0, 0, a2(k), Rotacion3D(0, 0, a3(k), v3)));
    EF = joint3 + p3(1:3);
    scatter3(EF(1), EF(2), EF(3), 100, 'filled', 'MarkerFaceColor', 'red');

    % Eslabones (lineas entre articulaciones)
    line([joint1(1) joint2(1)], [joint1(2) joint2(2)], [joint1(3) joint2(3)], 'color', 'black', 'linewidth', 2);
    line([joint2(1) joint3(1)], [joint2(2) joint3(2)], [joint2(3) joint3(3)],'color', 'black', 'linewidth', 2);
    line([joint3(1) EF(1)],     [joint3(2) EF(2)],     [joint3(3) EF(3)], 'color', 'black', 'linewidth', 2);

    pause(0.05)
end