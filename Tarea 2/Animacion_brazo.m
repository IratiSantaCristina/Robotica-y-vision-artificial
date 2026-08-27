clear 
close all
clf

%%MEDIDAS
    l1 = 0.8;
    l2 = 0.4;
    Theta1_2 = pi/4;
    Theta2_2 = -pi/6;

%% Rotación a 45º
for Theta1 = 0:0.05:Theta1_2   
    clf
    hold on

    %%EJES 
    axis equal
    axis([0 1.5 0 1.5]) 
    line([0 2], [0 0], [0 0], "Color",'red','LineWidth',3);
    line([0 0], [0 2], [0 0], "Color",'green','LineWidth',3);
  
    %%Puntos
    %%Punto 1 (en el origen)
    joint_1 = [0 0]';
    scatter(joint_1(1), joint_1(2), 100, 'filled', 'MarkerFaceColor', 'blue');

    l1x = l1*cos(Theta1);
    l1y = l1*sin(Theta1);

    %%Punto 2
    joint_2 = [l1x, l1y]';
    scatter(joint_2(1), joint_2(2), 100, 'filled', 'MarkerFaceColor', 'red');

    l2x = l2*cos(Theta1);
    l2y = l2*sin(Theta1);

    %%Efecto final
    EFx = l1x + l2x;
    EFy = l1y + l2y;
    EF = [EFx EFy]';

    scatter(EF(1), EF(2), 100, 'filled', 'MarkerFaceColor','blue');

    %%Eslabones
    line([joint_1(1) joint_2(1)],[joint_1(2) joint_2(2)], [0 0],...
    "Color","black", "LineWidth", 2);
    line([joint_2(1) EF(1)],[joint_2(2) EF(2)], [0 0],...
    "Color","black", "LineWidth", 2);

    pause(0.05)
end

%% Rotación del segundo eslabón
for Theta2 = 0:-0.05:Theta2_2   
    clf
    hold on

    %%EJES
    axis equal
    axis([0 1.5 0 1.5])
    line([0 2], [0 0], [0 0], "Color",'red','LineWidth',3);
    line([0 0], [0 2], [0 0], "Color",'green','LineWidth',3);
  
    %%Puntos
    %%Punto 1 (en el origen)
    joint_1 = [0 0]';
    scatter(joint_1(1), joint_1(2), 100, 'filled', 'MarkerFaceColor', 'blue');

    l1x = l1*cos(Theta1_2);
    l1y = l1*sin(Theta1_2);
 
    %%Punto 2
    joint_2 = [l1x, l1y]';
    scatter(joint_2(1), joint_2(2), 100, 'filled', 'MarkerFaceColor', 'red');

    l2x = l2*cos(Theta1_2 + Theta2);
    l2y = l2*sin(Theta1_2 + Theta2);

    %%Efecto final
    EFx = l1x + l2x;
    EFy = l1y + l2y;
    EF = [EFx EFy]';

    scatter(EF(1), EF(2), 100, 'filled', 'MarkerFaceColor','blue');

    %%Eslabones
    line([joint_1(1) joint_2(1)],[joint_1(2) joint_2(2)], [0 0],...
    "Color","black", "LineWidth", 2);
    line([joint_2(1) EF(1)],[joint_2(2) EF(2)], [0 0],...
    "Color","black", "LineWidth", 2);

    pause(0.05)
end
