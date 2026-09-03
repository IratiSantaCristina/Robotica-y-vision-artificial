function NewPoints = MoverCaja(Theta, PointMatrix)

P1 = PointMatrix(:,1);
P2 = PointMatrix(:,2);
P3 = PointMatrix(:,3);
P4 = PointMatrix(:,4);

P5 = PointMatrix(:,5);
P6 = PointMatrix(:,6);
P7 = PointMatrix(:,7);
P8 = PointMatrix(:,8);

P1t = Rz(Theta) * P1;
P2t = Rz(Theta) * P2;
P3t = Rz(Theta) * P3;
P4t = Rz(Theta) * P4;

P5t = Rz(Theta) * P5;
P6t = Rz(Theta) * P6;
P7t = Rz(Theta) * P7;
P8t = Rz(Theta) * P8;

NewPoints = [P1t, P2t, P3t, P4t, P5t, P6t, P7t, P8t];

end
