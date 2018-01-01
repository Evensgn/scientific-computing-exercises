function ret = direct_iteration(x0, phi, eps)
    prev_x = x0;
    step_count = 0;
    while true
        step_count = step_count + 1;
        x = phi(prev_x);
        if abs(x - prev_x) < eps
            break;
        end
        prev_x = x;
    end
    fprintf("step number using direct_iteration: %d\n", step_count);
    ret = x;
end

