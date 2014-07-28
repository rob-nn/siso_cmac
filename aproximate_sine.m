clear all; clc; 

figure();
x = 0:0.1:2*pi;
y = sin(x);
plot(x, y);


siso_cmac = create_siso_cmac(
	e_min = 0,
	e_max = 2*pi,
	q = 0.01,
	nl = 30,
	beta = 0.7,
	iterations = 20 
);
siso_cmac = train(siso_cmac, x, y);

x = 0:0.01:2*pi;
y = sin(x);
o = [];
for i = [1: size(x, 2)]
	o = [o, get_output( siso_cmac, x(i) )];
end

hold on;
plot(x, o, 'color', 'r');
