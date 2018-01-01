x_10 = -1 : (1 - -1) / 10 : 1;
x_20 = -1 : (1 - -1) / 20 : 1;
f_10 = f(x_10);
f_20 = f(x_20);

x_plot = -1 : (1 - -1) / 500 : 1;
f_plot = f(x_plot);

dy1 = -50*(-1)/(1+25*(-1)^2)^2;
dy2 = -50*(1)/(1+25*(1)^2)^2;
d2y1 = 50*(75*(-1)^2-1)/(25*(-1)^2+1)^3;
d2y2 = 50*(75*1^2-1)/(25*1^2+1)^3;

subplot(1, 3, 1);
plot(x_plot, f_plot, 'b', 'LineWidth', 1);
hold;
y1_plot = spline_zhou(x_10, f_10, x_plot, 1, [dy1, dy2]);
plot(x_plot, y1_plot, 'r', 'LineWidth', 1);
title('End condition 1');
box off;

subplot(1, 3, 2);
plot(x_plot, f_plot, 'b', 'LineWidth', 1);
hold;
y1_plot = spline_zhou(x_10, f_10, x_plot, 2, [d2y1, d2y2]);
plot(x_plot, y1_plot, 'r', 'LineWidth', 1);
title('End condition 2');
box off;

subplot(1, 3, 3);
plot(x_plot, f_plot, 'b', 'LineWidth', 1);
hold;
y1_plot = spline_zhou(x_10, f_10, x_plot, 3, []);
plot(x_plot, y1_plot, 'r', 'LineWidth', 1);
title('End condition 3');
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
