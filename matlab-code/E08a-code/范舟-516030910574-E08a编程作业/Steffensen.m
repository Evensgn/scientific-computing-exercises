function ret = Steffensen(x0, phi, eps)
    prev_x = x0;
    step_count = 0;
    while true
        step_count = step_count + 1;
        x = prev_x - (phi(prev_x) - prev_x)^2 / ...
            (phi(phi(prev_x)) - 2 * phi(prev_x) + prev_x);
        if abs(x - prev_x) < eps
            break;
        end
        prev_x = x;
    end
    fprintf("step number using Steffensen: %d\n", step_count);
    ret = x;
end