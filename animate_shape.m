function animate_shape(flag_length,radius,basal_sliding,basal_angle,sliding_distance,t_max,num_frames)
    if nargin < 7
        num_frames = 100;
    end
    ts = linspace(0,t_max,num_frames);
    v = VideoWriter('ani.mp4', 'MPEG-4');
    open(v);
    for i = 1:length(ts)
        clf
        t = ts(i);
        plot_shape(flag_length,radius,basal_sliding,basal_angle,sliding_distance,t);
        ylim([-0.5,0.5])
        xlim([0,1])
        frame = getframe(gcf);
        writeVideo(v, frame);
        pause(0.01)
    end
    close(v);
end