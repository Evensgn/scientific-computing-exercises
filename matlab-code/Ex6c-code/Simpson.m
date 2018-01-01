function ret = Simpson(f, a, b, n)
    x = linspace(a, b, 2 * n + 1);
    h = (b - a) / n;
    fx = arrayfun(f, x);
    ret = h / 6. * (sum(fx(1 : 2 : 2 * n - 1)) + sum(fx(3 : 2 : 2 * n + 1)) ...
        + 4. * sum(fx(2 : 2 : 2 * n)));
end