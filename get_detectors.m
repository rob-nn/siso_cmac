function d = get_detectors(siso_cmac, e)
	d  = zeros(size(siso_cmac.weights));
	n = 0;
	for layer = [0:(siso_cmac.nl -1)]
		di = get_detector(siso_cmac, e, layer);
		first = get_detector(siso_cmac, siso_cmac.e_min, layer);
		last = get_detector(siso_cmac, siso_cmac.e_max, layer);
		d(n + di - first + 1) = 1;
		n = n + last -first + 1;
	end
end;

%!shared siso_cmac
%!	siso_cmac = create_siso_cmac(
%!		e_min = 0,
%!		e_max = 11,
%!		q = 1,
%!		nl = 3);
%!test
%!	assert(find(get_detectors(siso_cmac, 0)), [1 5 10]');
%!test
%!	assert(find(get_detectors(siso_cmac, 5)), [2 7 12]');
%!test
%!	assert(find(get_detectors(siso_cmac, 11)), [4 9 14]');

