function DibujaCaja(PointMatrix, color)

P1 = PointMatrix(:,1);
P2 = PointMatrix(:,2);
P3 = PointMatrix(:,3);
P4 = PointMatrix(:,4);

P5 = PointMatrix(:,5);
P6 = PointMatrix(:,6);
P7 = PointMatrix(:,7);
P8 = PointMatrix(:,8);

%Dibujo Base
LineaPuntos(P1,P2,color)
LineaPuntos(P2,P3,color)
LineaPuntos(P3,P4,color)
LineaPuntos(P4,P1,color)

%Dubujo Tapa
LineaPuntos(P5,P6,color)
LineaPuntos(P6,P7,color)
LineaPuntos(P7,P8,color)
LineaPuntos(P8,P5,color)

%Dibujo Pared
LineaPuntos(P1,P5,color)
LineaPuntos(P2,P6,color)
LineaPuntos(P3,P7,color)
LineaPuntos(P4,P8,color)

end
