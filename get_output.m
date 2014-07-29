function [o, d] = get_output(siso_cmac, e)
	d = get_detectors(siso_cmac, e);
	o = d' * siso_cmac.weights;
#	if siso_cmac.e_min == 0 && siso_cmac.e_max == 1
#		o = 1 ./ (1 .+ exp(-o));
#	end
end

%!test
%!	siso_cmac = create_siso_cmac(
%!		e_min = 0,
%!		e_max = 11,
%!		q = 1,
%!		nl = 3, alpha=1, iterations=1);
%!	siso_cmac.weights = ones(size(siso_cmac.weights));
%!	assert(get_output(siso_cmac, 7), 3);
