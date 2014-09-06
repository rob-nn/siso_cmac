load angles.mat
frame_rate = 315; %miliscontds
left_knees_angles = angles(3).angle_left;
right_knees_angles = angles(3).angle_right;

t = [0:(size(right_knees_angles, 1) -1)] * (1/frame_rate);

hf = figure();

plot(t, left_knees_angles, 'color', 'b', 'linewidth', 2);
hold on;
plot(t, right_knees_angles, 'color', 'r', 'linewidth', 2);
set(gca, 'fontsize', 15);
hl = legend('Esquerdo', 'Direito');
set(hl, 'fontsize', 15);
set(hl, 'orient', 'horizontal');
legend boxoff
legend left
ylabel('Angulos (Radianos)', 'FontSize', 15);
xlabel('t (Segundos)', 'fontsize', 15);

print(hf, '~/Dropbox/cbeb/figure3.png', '-dpng');
