x_10 = -1 : (1 - -1) / 10 : 1;
x_20 = -1 : (1 - -1) / 20 : 1;
f_10 = f(x_10);
f_20 = f(x_20);

x_plot = -1 : (1 - -1) / 500 : 1;
f_plot = f(x_plot);

subplot(2, 2, 1);
plot(x_plot, f_plot, 'b', 'LineWidth', 1);
hold;
y1_plot = newton(x_10, f_10, x_plot);
plot(x_plot, y1_plot, 'r', 'LineWidth', 1);
title('n = 10, Polynomial');
box off;

subplot(2, 2, 2);
plot(x_plot, f_plot, 'b', 'LineWidth', 1);
hold;
y2_plot = newton(x_20, f_20, x_plot);
plot(x_plot, y2_plot, 'r', 'LineWidth', 1);
title('n = 20, Polynomial');
box off;

subplot(2, 2, 3);
plot(x_plot, f_plot, 'b', 'LineWidth', 1);
hold;
y1_plot = spline(x_10, f_10, x_plot);
plot(x_plot, y1_plot, 'r', 'LineWidth', 1);
title('n = 10, Cubic Spline');
box off;

subplot(2, 2, 4);
plot(x_plot, f_plot, 'b', 'LineWidth', 1);
hold;
y2_plot = spline(x_20, f_20, x_plot);
plot(x_plot, y2_plot, 'r', 'LineWidth', 1);
title('n = 20, Cubic Spline');
box off;

function ret = f(x)
    ret = 1 ./ (1 + 25 * x .^ 2);
end

function yq = newton(x, y, xq)
    n = length(x);
    d(:, 1) = y;
    for i = 2 : n
        dx(i : n) = x(i : n) - x(1 : n - i + 1);
        d(i : n, i) = (d(i : n, i - 1) - d(i - 1 : n - 1, i - 1)) ./ dx(i : n)';
        a(i) = d(i, i);
    end
    yq = calc(a, x, xq);
    function y = calc(a, x, xq)
        n = length(x);
        y = 0;
        for i = 1 : n
            t = a(i);
            for j = 1 : i - 1
                t = t .* (xq - x(j));
            end
            y = y + t;
        end
    end
end
