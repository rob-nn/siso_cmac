# See document "Gait Pattern Based on CMAC Neural Network for Robotic Applications" section 2.1 "CMAC Neural Network"
function siso_cmac = create_siso_cmac(e_min, e_max, q, nl)
	siso_cmac.e_min = e_min;
	siso_cmac.e_max = e_max;
	siso_cmac.q = q;
	siso_cmac.nl = nl;
	siso_cmac.sc = siso_cmac.q * siso_cmac.nl;
	siso_cmac.weights = zeros(get_number_weights(siso_cmac), 1);
end;

%!shared siso_cmac
%!	siso_cmac = create_siso_cmac(0, 11, 1, 3);
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
%	assert(size(siso_cmac.weights), [14 1];

