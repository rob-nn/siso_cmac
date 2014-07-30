close all; clear all; clc;


load angles.mat

h1 = figure();
hold on;
plot(angles(3).angle_left, 'color', 'r');
plot(angles(3).angle_right, 'color', 'b');
legend('Joelho Esquerdo', 'Joelho Direito');
xlabel('t');
ylabel('Angulo (rads)');



h2 = figure();
hold on;
plot(angles(3).av_left, 'color', 'b');
xlabel('t');
ylabel('V. Ang. (rads/s)');





print(h1, 'fig2.png', '-dpng');
print(h2, 'fig3.png', '-dpng');


