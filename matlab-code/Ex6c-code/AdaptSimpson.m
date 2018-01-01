function ret = AdaptSimpson(f, a, b, eps)
    mid = (a + b) / 2.;
    s1 = SimpleSimpson(f, a, b);
    s2 = SimpleSimpson(f, a, mid) + SimpleSimpson(f, mid, b);
    if abs(s1 - s2) < 15. * eps
        ret = s2 + 1. / 15. * (s2 - s1);
    else
        fprintf("Interval Split: [%.8f, %.8f] -> [%.8f, %.8f], [%.8f, %.8f] \n",...
            a, b, a, mid, mid, b);
        ret = AdaptSimpson(f, a, mid, eps / 2.) + ...
            AdaptSimpson(f, mid, b, eps / 2.);
    end
end

function ret = SimpleSimpson(f, a, b)
    ret = (b - a) / 6 * (f(a) + 4. * f((a + b) / 2.) + f(b));
end