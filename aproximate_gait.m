clear all; clc; 
siso_cmac = create_siso_cmac(
	e_min = 2.5,
	e_max = 3.05,
	q = 0.00001,
	nl = 70,
	beta = 1,
	iterations =10
);

load angles.mat
for i = 1:5
	angles(i).angle_right = normalize(siso_cmac, angles(i).angle_right);
	angles(i).angle_left = normalize(siso_cmac, angles(i).angle_left);
end;

x = y =[];
#for i = floor(linspace(1, 746, 224))
for i = 1:746
	x = [x angles(3).angle_left(i)];
	y = [y angles(3).angle_right(i)];
end;

siso_cmac.e_min = 0;
siso_cmac.e_max = 1;
siso_cmac.weights = zeros(get_number_weights(siso_cmac), 1);

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
