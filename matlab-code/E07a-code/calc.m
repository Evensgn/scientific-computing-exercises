

prev_x = 1.5;
while true
    x = (1 + prev_x^2)^(1 / 3);
    fprintf("%.4f\n", x);
    if abs(x - prev_x) <= 1 / 4 * 10^(-3)
        break;
    end
    prev_x = x;
end
fprintf("%.3f\n", x);
