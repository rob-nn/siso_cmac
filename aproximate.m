clear all; clc; 
siso_cmac = create_siso_cmac(
	e_min = 2.5,
	e_max = 3.05,
	q = 0.001,
	nl = 3,
	beta = 0.01,
	iterations = 10
);

load angles.mat

x = y =[];
#for i = floor(linspace(1, 746, 224))
for i = 1:746
	x = [x angles(3).angle_left(i)];
	y = [y angles(3).angle_right(i)];
end;

%figure();
%plot(x, 'color', 'b');
%hold on;
%plot(y, 'color', 'r');
%legend('Joelho esquerdo', 'Joelho Direito');

siso_cmac = train(siso_cmac, x, y);
for i = 3:3
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

plot_walk(siso_cmac, angles);
