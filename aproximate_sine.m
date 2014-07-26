clear all; clc; 

figure();
x = 0:0.1:2*pi;
y = sin(x);
plot(x, y);
siso_cmac = train(x, y, 20);

x = 0:0.01:2*pi;
y = sin(x);
o = [];
for i = [1: size(x, 2)]
	o = [o, get_output( siso_cmac, x(i) )];
end

hold on;
plot(x, o, 'color', 'r');
