function vector4d = Rotacion3D(thetaX, thetaY, thetaZ, vectorIn)

Mx = [1 0          0           0;
      0 cos(thetaX) -sin(thetaX) 0;
      0 sin(thetaX)  cos(thetaX) 0;
      0 0           0           1];

My = [ cos(thetaY) 0 sin(thetaY) 0;
       0           1 0          0;
      -sin(thetaY) 0 cos(thetaY) 0;
       0           0 0          1];

Mz = [cos(thetaZ) -sin(thetaZ) 0 0;
      sin(thetaZ)  cos(thetaZ) 0 0;
      0            0           1 0;
      0            0           0 1];

MatRot = Mz * My * Mx;
vector4d = MatRot * vectorIn;
end