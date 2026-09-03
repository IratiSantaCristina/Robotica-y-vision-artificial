function PointMatrix = GetPointMatrix(L, W, H, Xi, Yi, Zi)

%Puntos Base
P1 = [Xi; Yi; Zi; 1];
P2 = [Xi + W; Yi; Zi; 1];
P3 = [Xi + W; Yi + L; Zi; 1];
P4 = [Xi; Yi + L; Zi; 1];

%Puntos Tapa
P5 = [Xi; Yi; Zi + H; 1];
P6 = [Xi + W; Yi; Zi + H; 1];
P7 = [Xi + W; Yi + L; Zi + H; 1];
P8 = [Xi; Yi + L; Zi + H; 1];

PointMatrix = [P1, P2, P3, P4, P5, P6, P7, P8];

end
