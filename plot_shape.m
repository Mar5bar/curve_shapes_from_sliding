function plot_shape(length,radius,basal_sliding,basal_angle,sliding_distance,t)
    if nargin < 6
        t = 0;
    end

    % basal_sliding, basal_angle, and sliding_distance are functions of time. sliding_distance is a function of arclength and time.

    arclengths = linspace(0,length,1000);
    % Exploit the (oddly simple) relation between the angles and the sliding distance. 
    % We have sliding_distance = radius*(angle - basal_angle) + basal_sliding.
    angles = (sliding_distance(arclengths,t) - basal_sliding(t)) / radius + basal_angle(t);

    % Integrate cos(angles) and sin(angles) to give the shape of the flagellum.
    x = cumtrapz(arclengths,cos(angles));
    y = cumtrapz(arclengths,sin(angles));

    % Get upper and lower halves of the flagellum.
    x_up = x - sin(angles)*radius/2;
    y_up = y + cos(angles)*radius/2;
    x_low = x + sin(angles)*radius/2;
    y_low = y - cos(angles)*radius/2;

    hold on
    plot(x_up,y_up,'LineWidth',2,'Color','black')
    plot(x_low,y_low,'LineWidth',2,'Color','black')
    plot([x_up(end),x_low(end)],[y_up(end),y_low(end)],'LineWidth',2,'Color','black')
    text(x(1)-0.025,y(1)-0.1,'Base','FontSize',24)
    scatter(0,0,200,'filled','black')
    axis equal
    axis off
end