function siso_cmac = train(siso_cmac, input, desired)
	for j = 1: siso_cmac.iterations
		for i =[ 1:size(desired, 2)]
			[output, d] = get_output(siso_cmac, input(i));
			siso_cmac.weights = siso_cmac.weights .+ d .*siso_cmac.beta * (desired(i) - output)/siso_cmac.nl;
		end
	end;
end
