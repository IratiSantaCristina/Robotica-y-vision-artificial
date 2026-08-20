cuadrado = [2 5 5 2 2; 
            2 2 5 5 2; 
            0 0 0 0 0; 
            1 1 1 1 1];  
dy = 4;

for i = 0:0.1:dy
    clf
    hold on
    grid on
    axis([0 10 0 10 0 1]) 
    axis equal
    
    % Ejes
    line([0 10],[0 0],[0 0],'color','red','linewidth', 2)
    line([0 0],[0 10],[0 0],'color','green','linewidth', 2)
    
    % Cuadrado 1
    line(cuadrado(1,:), cuadrado(2,:), cuadrado(3,:), 'color', 'blue', 'LineWidth', 2);
    
    % Traslación del cuadrado
    cuadrado2 = Traslacion(0, i, 0, cuadrado);
    line(cuadrado2(1,:), cuadrado2(2,:), cuadrado2(3,:), 'color', 'magenta', 'LineWidth', 2);

    pause(0.05)
end