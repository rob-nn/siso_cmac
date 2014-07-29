clear all; clc; 

load angles.mat

figure();
x = angles(3).angle_left(140:607)';
y = angles(3).angle_right(140:607)';

plot(x, 'color', 'b');
hold on;
plot(y, 'color', 'r');
legend('Joelho esquerdo', 'Joelho Direito');

siso_cmac = create_siso_cmac(
	e_min = 2.5,
	e_max = 3.05,
	q = 0.0001,
	nl = 55,
	beta = 0.7,
	iterations = 200
);
siso_cmac = train(siso_cmac, x, y);


for i = 3:3
#	x = angles(i).angle_left';
#	y = angles(i).angle_right';

	o = [];
	for j = [1: size(x, 2)]
		o = [o, get_output( siso_cmac, x(j) )];
	end

	figure();
	plot(y, 'color', 'b');
	hold on;
	plot(o, 'color', 'r');
	legend('Joelho esquerdo', strcat('Aproximacao: ', mat2str(i)));
end
