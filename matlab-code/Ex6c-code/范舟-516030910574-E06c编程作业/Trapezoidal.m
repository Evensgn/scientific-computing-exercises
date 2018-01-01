function ret = Trapezoidal(f, a, b, n)
    x = linspace(a, b, n + 1);
    h = (b - a) / n;
    fx = arrayfun(f, x);
    ret = h / 2. * (fx(1) + 2. * sum(fx(2 : n)) + fx(n + 1));
end