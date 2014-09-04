load angles.mat

left_knee_angular_velocities = angles(3).av_left;
frame_rate = 315; %miliscontds
t = [0:(size(left_knee_angular_velocities, 1) -1)] * (1/frame_rate);

hf = figure();

plot(t, left_knee_angular_velocities, 'color', 'b', 'linewidth', 2);
hold on;
set(gca, 'fontsize', 15);
ylabel('Vel. angulares (Rad./Seg.)', 'FontSize', 15);
xlabel('t (Segundos)', 'fontsize', 15);

print(hf, '~/Dropbox/cbeb/figure4.png', '-dpng');
