a = 0; b = 1;
n_arr = 1 : 300;
I = -4 / 9;

d = abs(arrayfun(@(n_) Trapezoidal(@ex1_fun, a, b, n_), n_arr) - I);
% d = abs(arrayfun(@(n_) Simpson(@ex1_fun, a, b, n_), n_arr) - I);
% d = abs(arrayfun(@(n_) Romberg(@ex1_fun, a, b, n_), n_arr) - I);
h = (b - a) ./ n_arr;

plot(h, d, 'm-o');
% plot(n_arr, d, 'b-x');

% approx_I = AdaptSimpson(@ex1_fun, a, b, 10^(-4));
% fprintf("%.8f %.8f\n", approx_I, abs(approx_I - I));

function y = ex1_fun(x)
    if x == 0
        y = 0;
    else
        y = sqrt(x) * log(x);
    end
end