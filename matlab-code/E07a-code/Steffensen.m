function ret = Steffensen(x0, phi, eps)
    prev_x = x0;
    while true
        x = prev_x - (phi(prev_x) - prev_x)^2 / ...
            (phi(phi(prev_x)) - 2 * phi(prev_x) + prev_x);
        fprintf("%.6f\n", x);
        if abs(x - prev_x) < 0.1 * eps
            break;
        end
        prev_x = x;
    end
    ret = x;
end