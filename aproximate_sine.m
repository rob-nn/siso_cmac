clear all; clc; close all;
x = [0:0.005:(2*pi)];
y = sin(x);
plot(x, y);
xt = [];
yt = [];
for i = 1:size(x, 2)
	if mod(i, 10) ==0
		xt = [xt, x(i)];
		yt = [yt, y(i)];
	end	
end
hold on;
plot (xt, yt, 'color', 'g');

siso_cmac = train(xt, yt, 1000);
o =[];
for i =[ 1:size(yt, 2)]
	output = get_output(siso_cmac, xt(i));
	o = [o, output];
end

plot(xt, o, 'color', 'r');
