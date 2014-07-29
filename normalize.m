function n = normalize(siso_cmac, e)

	n = (e .- siso_cmac.e_min) ./ (siso_cmac.e_max .- siso_cmac.e_min);

end


%!shared siso_cmac
%!	siso_cmac = create_siso_cmac(-10, 10, 1, 1, 1, 1);
%!test
%!	assert(normalize(siso_cmac, [10, 9, 8 , 0]) <= 1);
%!test
%!	assert(normalize(siso_cmac, [-10, -9, -8 , 0]) >= -1);
