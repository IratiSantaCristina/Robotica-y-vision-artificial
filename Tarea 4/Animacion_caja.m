close all
clear
clf

[W, L, H] = LeerDim();
fprintf("[DEBUG] Ancho: %f | Largo: %f | Alto: %f \n", W, L, H);

PointMatrix = GetPointMatrix(L, W, H, 0, 0, 0);

%%Elegir el tipo de movimiento
Opcion = input(sprintf(['Tipos de movimiento disponibles:\n' ...
    '1. Traslacion en X\n' ...
    '2. Traslacion en Y\n' ...
    '3. Traslacion en Z\n' ...
    '4. Rotacion en X\n' ...
    '5. Rotacion en Y\n' ...
    '6. Rotacion en Z\n' ...
    'Indica el numero de la opcion: ']));

N = 50;

if Opcion == 1
    Dist = input("Indica la distancia a trasladar en X: ");
    pasos = linspace(0, Dist, N);
elseif Opcion == 2
    Dist = input("Indica la distancia a trasladar en Y: ");
    pasos = linspace(0, Dist, N);
elseif Opcion == 3
    Dist = input("Indica la distancia a trasladar en Z: ");
    pasos = linspace(0, Dist, N);
elseif Opcion == 4
    Theta = input("Indica el angulo de rotacion en X [rad]: ");
    pasos = linspace(0, Theta, N);
elseif Opcion == 5
    Theta = input("Indica el angulo de rotacion en Y [rad]: ");
    pasos = linspace(0, Theta, N);
elseif Opcion == 6
    Theta = input("Indica el angulo de rotacion en Z [rad]: ");
    pasos = linspace(0, Theta, N);
end

for i = 1:N
    clf
    hold on
    grid on
    DibujaEjes(3)
    axis equal

    % Caja original, se queda fija
    DibujaCaja(PointMatrix, 'blue');

    % Coordenadas originales de la caja
    X = PointMatrix(1,:);
    Y = PointMatrix(2,:);
    Z = PointMatrix(3,:);

    if Opcion == 1
        cla_actual = Traslacion(pasos(i), 0, 0, PointMatrix);

    elseif Opcion == 2
        cla_actual = Traslacion(0, pasos(i), 0, PointMatrix);

    elseif Opcion == 3
        cla_actual = Traslacion(0, 0, pasos(i), PointMatrix);

    elseif Opcion == 4
        % Rotacion en X
        Xn = X;
        Yn = Y*cos(pasos(i)) - Z*sin(pasos(i));
        Zn = Y*sin(pasos(i)) + Z*cos(pasos(i));
        cla_actual = [Xn; Yn; Zn; PointMatrix(4,:)];

    elseif Opcion == 5
        % Rotacion en Y
        Xn =  X*cos(pasos(i)) + Z*sin(pasos(i));
        Yn = Y;
        Zn = -X*sin(pasos(i)) + Z*cos(pasos(i));
        cla_actual = [Xn; Yn; Zn; PointMatrix(4,:)];

    elseif Opcion == 6
        % Rotacion en Z
        Xn = X*cos(pasos(i)) - Y*sin(pasos(i));
        Yn = X*sin(pasos(i)) + Y*cos(pasos(i));
        Zn = Z;
        cla_actual = [Xn; Yn; Zn; PointMatrix(4,:)];
    end

    % Caja en movimiento
    DibujaCaja(cla_actual, 'magenta');

    pause(0.05)
end
