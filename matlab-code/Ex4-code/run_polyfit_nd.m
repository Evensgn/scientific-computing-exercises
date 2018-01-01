% run_polyfit_nd.m
x = [0.0, 0.1, 0.2, 0.3, 0.5, 0.8, 1.0];
y = [1.0, 0.41, 0.50, 0.61, 0.91, 2.02, 2.46];
x_draw = linspace(0, 1);

p6 = polyfit(x, y, 6);
y_fit6 = polyval(p6, x_draw);
hold;
plot(x_draw, y_fit6, 'LineWidth', 1);
plot(x, y, 'bo', 'MarkerSize', 6);