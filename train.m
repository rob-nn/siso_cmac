function siso_cmac = train(input, desired, iterations)
	siso_cmac = create_siso_cmac(
		e_min = 0,
		e_max = 2*pi,
		q = 0.01,
		nl = 20 
	);
	beta = 1;
	for j = 1: iterations
		for i =[ 1:size(desired, 2)]
			[output, d] = get_output(siso_cmac, input(i));
			siso_cmac.weights = siso_cmac.weights .+ d .*beta * (desired(i) - output)/siso_cmac.nl;
		end
	end;
end
