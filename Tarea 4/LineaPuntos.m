function LineaPuntos(Pini, Pfin, Color)

DeltaX = [Pini(1) Pfin(1)];
DeltaY = [Pini(2) Pfin(2)];
DeltaZ = [Pini(3) Pfin(3)];

line(DeltaX, DeltaY, DeltaZ, LineWidth=2,Color=Color);

end
