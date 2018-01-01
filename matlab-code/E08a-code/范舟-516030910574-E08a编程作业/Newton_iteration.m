x0 = -5 + 5i;
eps = 1e-8;
ans1 = direct_iteration(x0, @(x) Newton_phi(@f1, @d_f1, @d2_f1, x), eps);
ans2 = direct_iteration(x0, @(x) Newton_phi(@f2, @d_f2, @d2_f2, x), eps)
fprintf("ans1 = %.8f, ans2 = %.8f\n", ans1, ans2);

function y = Newton_phi(f, d_f, d2_f, x)
    y = x - (f(x) * d_f(x)) / (d_f(x)^2 - f(x) * d2_f(x)); 
end

function y = f1(x)
    y = x^2 - 3 * x + 2 - exp(x);
end

function y = d_f1(x)
    y = 2 * x - 3 - exp(x);
end

function y = d2_f1(x)
    y = 2 - exp(x);
end

function y = f2(x)
    y = x^3 + 2 * x^2 + 10 * x - 20; 
end

function y = d_f2(x)
    y = 3 * x^2 + 4 * x + 10;
end

function y = d2_f2(x)
    y = 6 * x + 4;
end