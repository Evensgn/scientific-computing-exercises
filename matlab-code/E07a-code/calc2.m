x0 = 1.5;
eps = 10^(-4);
ans2 = Steffensen(x0, @phi2, eps);
% ans3 = Steffensen(x0, @phi3, eps);
fprintf("%.5f %.5f\n", ans2, ans3);

function y = phi2(x)
    y = (1 + x^2)^(1 / 3);
end

function y = phi3(x)
    y = 1 / sqrt(x - 1);
end