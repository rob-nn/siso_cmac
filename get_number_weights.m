function n = get_number_weights(siso_cmac)
	n = 0;
	for layer = [0:(siso_cmac.nl -1)]
		first = get_detector(siso_cmac, siso_cmac.e_min, layer);
		last = get_detector(siso_cmac, siso_cmac.e_max, layer);
		n = n + last - first + 1;
	end;
end;

%!shared siso_cmac
%!	siso_cmac = create_siso_cmac(
%!		e_min = 0,
%!		e_max = 11,
%!		q = 1,
%!		nl = 3);
%!test
%!	assert(get_number_weights(siso_cmac), 14);
%!test
%!	siso_cmac = create_siso_cmac(
%!		e_min = -5,
%!		e_max = 6,
%!		q = 1,
%!		nl = 3);
%!	assert(get_number_weights(siso_cmac), 14);
