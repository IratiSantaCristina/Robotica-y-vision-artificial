function dibujaBrazoGeo_GUI(app, l1, l2, l3, Theta1, Theta2, Theta3, Theta4)
    cla(app.UIAxes)
    DibujaEjes_GUI(app.UIAxes, l1+l2+l3);
    hold(app.UIAxes, 'on')

    joint1 = [0 0 0]';

    Rv1 = l1*sin(Theta2);
    Rh1 = l1*cos(Theta2);
    joint2 = [Rh1*cos(Theta1); Rh1*sin(Theta1); Rv1];

    Rv2 = l1*sin(Theta2) + l2*sin(Theta2 + Theta3);
    Rh2 = l1*cos(Theta2) + l2*cos(Theta2 + Theta3);
    joint3 = [Rh2*cos(Theta1); Rh2*sin(Theta1); Rv2];

    Rv = l1*sin(Theta2) + l2*sin(Theta2 + Theta3) + l3*sin(Theta2 + Theta3 + Theta4);
    Rh = l1*cos(Theta2) + l2*cos(Theta2 + Theta3) + l3*cos(Theta2 + Theta3 + Theta4);
    EF = [Rh*cos(Theta1); Rh*sin(Theta1); Rv];

    scatter3(app.UIAxes, joint1(1), joint1(2), joint1(3), 100, 'filled', 'MarkerFaceColor', 'red');
    scatter3(app.UIAxes, joint2(1), joint2(2), joint2(3), 100, 'filled', 'MarkerFaceColor', 'red');
    scatter3(app.UIAxes, joint3(1), joint3(2), joint3(3), 100, 'filled', 'MarkerFaceColor', 'red');
    scatter3(app.UIAxes, EF(1),      EF(2),    EF(3),     100, 'filled', 'MarkerFaceColor', 'red');

    line(app.UIAxes, [joint1(1) joint2(1)], [joint1(2) joint2(2)], [joint1(3) joint2(3)], 'color', 'black', 'linewidth', 2);
    line(app.UIAxes, [joint2(1) joint3(1)], [joint2(2) joint3(2)], [joint2(3) joint3(3)], 'color', 'black', 'linewidth', 2);
    line(app.UIAxes, [joint3(1) EF(1)],     [joint3(2) EF(2)],     [joint3(3) EF(3)],     'color', 'black', 'linewidth', 2);

    pause(0.05)
end