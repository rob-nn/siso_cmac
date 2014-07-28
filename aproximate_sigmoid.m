clear all; clc; 

figure();
x = -5:0.1:5;
y = 1./(1.+exp(-x));
plot(x, y);


siso_cmac = create_siso_cmac(
	e_min = -5,
	e_max = 5,
	q = 0.01,
	nl = 30,
	beta = 1,
	iterations = 60 
);
siso_cmac = train(siso_cmac, x, y);

x = -5:0.01:5;
y = 1./(1.+exp(-x));
o = [];
for i = [1: size(x, 2)]
	o = [o, get_output( siso_cmac, x(i) )];
end

hold on;
plot(x, o, 'color', 'r');
