x0 = 1;
eps = 1e-8;
ans1 = direct_iteration(x0, @phi1,eps);
ans2 = direct_iteration(x0, @phi2, eps);
fprintf("ans1 = %.8f, ans2 = %.8f\n", ans1, ans2);

% ans1_steffensen = Steffensen(x0, @phi1,eps);
% fprintf("ans1_steffensen = %.8f\n", ans1_steffensen);

x0 = [3];
for i = 1 : 1
    fprintf("x0 = %d:\n", x0(i));
    direct_iteration(x0(i), @phi1,eps);
    Steffensen(x0(i), @phi1,eps);
end

function y = phi1(x)
    y = (x^2 - exp(x) + 2) / 3;
end

function y = phi2(x)
    y = x - (x^3 + 2 * x^2 + 10 * x - 20) / 100;
end