# See document "Gait Pattern Based on CMAC Neural Network for Robotic Applications" section 2.1 "CMAC Neural Network"
function siso_cmac = create_siso_cmac(e_min, e_max, q, nl, beta, iterations)
	siso_cmac.e_min = e_min; %input space min value
	siso_cmac.e_max = e_max; %input space max value
	siso_cmac.q = q; % quatification step
	siso_cmac.nl = nl; % number of layers
	siso_cmac.sc = siso_cmac.q * siso_cmac.nl; % sise cell
	siso_cmac.beta = beta;
	siso_cmac.iterations = iterations;
	siso_cmac.weights = unifrnd(-0.2, 0.2, [get_number_weights(siso_cmac), 1]);
end

%!shared siso_cmac
%!	siso_cmac = create_siso_cmac(0, 11, 1, 3, 1, 1);
%!test
%!	assert(siso_cmac.e_min,  0);
%!test
%!	assert(siso_cmac.e_max, 11);
%!test
%!	assert(siso_cmac.q, 1);
%!test	
%!	assert(siso_cmac.nl, 3);
%!test
%!	assert(siso_cmac.sc, 3);
%!test
%!	assert(size(siso_cmac.weights), [14 1]);
%!test
%!	assert(siso_cmac.beta, 1);
%!test
%!	assert(siso_cmac.iterations, 1);
