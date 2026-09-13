close all
clear
clf

l1 = input("Indica el tamano del primer eslabon [m]: ");
l2 = input("Indica la tamano del segundo eslabon [m]: ");
l3 = input("Indica la tamano del tercer eslabon [m]: ");

DibujaEjes(l1+l2+l3);
view(2)
axis equal

rot_1 = input("Indica el angulo de rotacion del primer eslabon [rad]: ");
rot_2 = input("Indica el angulo de rotacion del segundo eslabon [rad]: ");
rot_3 = input("Indica el angulo de rotacion del tercer eslabon [rad]: ");

N = 50;
a1 = linspace(0, rot_1, N);
a2 = linspace(0, rot_2, N);
a3 = linspace(0, rot_3, N);

for k = 1:N
    clf
    DibujaEjes(l1+l2+l3);
    view(2)
    axis equal
    hold on

    % Primera articulacion
    joint1 = [0 0]';
    scatter(joint1(1), joint1(2), 100, 'filled', 'MarkerFaceColor', 'red');

    % Eslabon 1
    v1 = [l1 0 0 1]';
    p1 = Rotacion(0, 0, a1(k), v1);
    joint2 = joint1 + p1(1:2);
    scatter(joint2(1), joint2(2), 100, 'filled', 'MarkerFaceColor', 'red');

    % Eslabon 2 (desde la punta del anterior
    v2 = [l2 0 0 1]';
    p2 = Rotacion(0, 0, a1(k), Rotacion(0, 0, a2(k), v2));
    joint3 = joint2 + p2(1:2);
    scatter(joint3(1), joint3(2), 100, 'filled', 'MarkerFaceColor', 'red');

    % Eslabon 3
    v3 = [l3 0 0 1]';
    p3 = Rotacion(0, 0, a1(k), Rotacion(0, 0, a2(k), Rotacion(0, 0, a3(k), v3)));
    EF = joint3 + p3(1:2);
    scatter(EF(1), EF(2), 100, 'filled', 'MarkerFaceColor', 'red');

    % Eslabones (lineas entre articulaciones)
    line([joint1(1) joint2(1)], [joint1(2) joint2(2)], 'color', 'black', 'linewidth', 2);
    line([joint2(1) joint3(1)], [joint2(2) joint3(2)], 'color', 'black', 'linewidth', 2);
    line([joint3(1) EF(1)],     [joint3(2) EF(2)],     'color', 'black', 'linewidth', 2);

    pause(0.05)
end