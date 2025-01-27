% For a given interdoublet sliding distance, calculate and plot the
% shape of the flagellum. s is an arclength coordinate along the flagellum. Time dependence is allowed in case animations are wanted.
flag_length = 1;
flag_radius = 0.01;
basal_sliding = @(t) 0;
basal_angle = @(t) 0;
sliding_distance = @(s,t) sin(2*pi*s/flag_length-t)*flag_radius;

% A static plot
figure
plot_shape(flag_length,flag_radius,basal_sliding,basal_angle,sliding_distance);
% Save the figure as a png.
exportgraphics(gcf,'flagellum.png','Resolution',300)

% An animated plot
figure
t_max = 2*pi;
animate_shape(flag_length,flag_radius,basal_sliding,basal_angle,sliding_distance,t_max)