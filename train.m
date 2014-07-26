function siso_cmac = train(input, desired, iterations)
	siso_cmac = create_siso_cmac(
		e_min = 0,
		e_max = 2*pi,
		q = 1,
		nl = 5 
	);
	beta = 1;
	o = [];
	for j = 1: iterations
		o = [];
		for i =[ 1:size(desired, 2)]
			output = get_output(siso_cmac, input(i));
			o = [o, output];
			siso_cmac.weights = siso_cmac.weights + beta * (desired(i) - output)/siso_cmac.nl;
		end
	end;
end
