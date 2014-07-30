function plot_walk(siso_cmac, angles)
	for i = 3:3
		x = angles(i).angle_left';
		y = angles(i).angle_right';
		o = [];
		for j = [1: size(x, 2)]
			o = [o, get_output( siso_cmac, x(j) )];
		end
		h1 = figure();
		plot(y, 'color', 'r');
		hold on;
		plot(o, 'color', 'b');
		legend('Joelho esquerdo', strcat('Aproximacao: ', mat2str(i)));
		xlabel('t');
		ylabel('Angulos normalizados');
		print(h1, 'fig5.png', '-dpng');


	end
end
