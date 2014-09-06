clear all; clc; 
siso_cmac = create_siso_cmac(
	e_min = 2.5,
	e_max = 3.05,
	q = 0.000001,
	nl = 1000,
	beta = 1,
	iterations =10
);

load angles.mat
for i = 1:5
	angles(i).angle_right = normalize(siso_cmac, angles(i).angle_right);
	angles(i).angle_left = normalize(siso_cmac, angles(i).angle_left);
end;

frame_rate = 315; % frames per second
x = y = t = [];
tprime = [0:(size(angles(3).angle_left, 1) - 1)] * (1/frame_rate);
training_set_indexes = [];
for i = floor(linspace(1, 746, 373)) % 50% of data from walk 3 to train net
	x = [x angles(3).angle_left(i)];
	y = [y angles(3).angle_right(i)];
	t = [t tprime(i)];
	training_set_indexes = [training_set_indexes i];
end;

testing_set = [];
for i = 1:size(angles(3).angle_left,1)
	if !any(i == training_set_indexes)
		testing_set = [testing_set; [tprime(i) angles(3).angle_left(i) angles(3).angle_right(i)]];
	end
end

siso_cmac.e_min = 0;
siso_cmac.e_max = 1;
siso_cmac.weights = zeros(get_number_weights(siso_cmac), 1);

siso_cmac = train(siso_cmac, x, y);
training_set = x;
desired = y;
save ('siso_cmac.mat', 'siso_cmac', 't', 'training_set', 'desired', 'testing_set');

