close all
clear
clf

l1 = input("Indica el tamano del primer eslabon [m]: ");
l2 = input("Indica la tamano del segundo eslabon [m]: ");

DibujaEjes(l1+l2);
view(2)
axis equal

% Pide el punto hasta que sea alcanzable
while true
    EFx = input("Indica el efector final en x [m]: ");
    EFy = input("Indica el efector final en y [m]: ");
    hipotenusa = sqrt(EFx^2 + EFy^2);
 
    if hipotenusa <= (l1 + l2) && hipotenusa >= abs(l1 - l2)
        break
    end
    fprintf("Punto fuera de alcance (rango: %.2f a %.2f m). Intenta de nuevo.\n", ...
            abs(l1 - l2), l1 + l2);
end
%Codo arriba o codo abajo
codo = input("Configuracion del codo (1 = arriba, 2 = abajo): ");

%Ley de cosenos
rho = atan(EFy/EFx);
r = hipotenusa;
cos_alpha = (l1^2 + r^2 - l2^2) / (2*l1*r);
cos_gamma = (l1^2 + l2^2 - r^2) / (2*l1*l2);
cos_alpha = max(min(cos_alpha, 1), -1);   % para que matlab no devuelva un número complejo
cos_gamma = max(min(cos_gamma, 1), -1);
alpha = acos(cos_alpha);
gamma = acos(cos_gamma);

%Cálculo de los ángulos
if codo == 1
    theta1 = rho + alpha;
    theta2 = -(pi - gamma);
else
    theta1 = rho - alpha;
    theta2 = pi - gamma;
end

fprintf("\ntheta1 = %.2f grados\n", rad2deg(theta1));
fprintf("theta2 = %.2f grados\n", rad2deg(theta2));


%Animación
N = 50;
a1 = linspace(0, theta1, N);
a2 = linspace(0, theta2, N);

for k = 1:N
    clf
    DibujaEjes(l1+l2);
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
    EF = joint2 + p2(1:2);
    scatter(EF(1), EF(2), 100, 'filled', 'MarkerFaceColor', 'red');

    % Eslabones (lineas entre articulaciones)
    line([joint1(1) joint2(1)], [joint1(2) joint2(2)], 'color', 'black', 'linewidth', 2);
    line([joint2(1) EF(1)], [joint2(2) EF(2)], 'color', 'black', 'linewidth', 2);

    pause(0.05)
end
