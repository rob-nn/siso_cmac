function plot_walk(siso_cmac, angles)
	for i = 1:5
		x = angles(i).angle_left';
		y = angles(i).angle_right';
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
end
