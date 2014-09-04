clear;
load siso_cmac.mat

hf = figure();

plot(t, desired, 'color', 'b', 'linewidth', 4);
hold on;


o = [];
for j = [1: size(training_set, 2)]
	o = [o, get_output( siso_cmac, training_set(j) )];
end

plot(t, o, 'color', 'r', 'linewidth', 2);
set(gca, 'fontsize', 15);
hl = legend('Esperado', 'Aproximacao');
set(hl, 'fontsize', 15);
set(hl, 'orient', 'vertical');
legend boxoff
legend left
ylabel('Angulos normalizados entre 0 e 1', 'FontSize', 15);
xlabel('t (Segundos)', 'fontsize', 15);

print(hf, '~/Dropbox/cbeb/figure5.png', '-dpng');


