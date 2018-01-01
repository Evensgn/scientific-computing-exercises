% run_polyfitn.m
x = [0.0, 0.1, 0.2, 0.3, 0.5, 0.8, 1.0];
y = [1.0, 0.41, 0.50, 0.61, 0.91, 2.02, 2.46];
x_draw = linspace(0, 1);

p3 = polyfitn(x, y, 3);
p4 = polyfitn(x, y, 4);
y_fit3 = polyval(p3, x_draw);
y_fit4 = polyval(p4, x_draw);
hold;
plot(x_draw, y_fit3, '--', 'LineWidth', 1);
plot(x_draw, y_fit4, 'LineWidth', 1);
plot(x, y, 'bo', 'MarkerSize', 6);