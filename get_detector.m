function di = get_detector(siso_cmac, e, number_layer)
	deltai = siso_cmac.q * number_layer;
	di = floor((e - siso_cmac.e_min - deltai)/siso_cmac.sc);
end


%!shared siso_cmac
%!	siso_cmac = create_siso_cmac(
%!		e_min = 0,
%!		e_max = 11,
%!		q = 1,
%!		nl = 3);
%!test
%!	assert(get_detector(siso_cmac, 0, 0), 0);
%!test
%!	assert(get_detector(siso_cmac, 5, 0), 1);
%!test
%!	assert(get_detector(siso_cmac, 11, 0), 3);
%!test
%!	assert(get_detector(siso_cmac, 0, 1), -1);
%!test
%!	assert(get_detector(siso_cmac, 5, 1), 1);
%!test
%!	assert(get_detector(siso_cmac, 11, 1), 3);

