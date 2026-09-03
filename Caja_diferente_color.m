close all
clear
clf

DibujaEjes(3)

[ W, L, H] = LeerDim();
fprintf("[DEBUG] Ancho: %f | Largo: %f | Alto: %f \n", W, L, H);

PointMatrix = GetPointMatrix(L, W, H, 0, 0, 0);

DibujaCaja(PointMatrix, 'blue');

Theta = input("Indica el angulo de rotacion [rad]: ");
NewPoints = MoverCaja(Theta, PointMatrix);

DibujaCaja(NewPoints, 'red');