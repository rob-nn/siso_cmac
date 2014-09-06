load angles.mat

load angles.mat

input = angles(3).angle_left;
desired = angles(3).angle_right;

figure();

plot(input, desired, 'o');
xlabel('Input - left knee');
ylabel('Desired -right knee');


