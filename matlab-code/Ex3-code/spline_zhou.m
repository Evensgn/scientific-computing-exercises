% function spline_zhou(), code by Zhou Fan
% Cubic Spline Interpolation under three classes of end conditions
% Usage:
%   condition (1): yq = spline_zhou(x, y, xq, 1, [a, b]);
%   condition (2): yq = spline_zhou(x, y, xq, 2, [a, b]);
%   condition (3): yq = spline_zhou(x, y, xq, 3, []);

function yq = spline_zhou(x, y, xq, cond_type, cond_v)
    n = length(x);
    h(1 : n - 1) = x(2 : n) - x(1 : n - 1);
    mu(2 : n - 1) = h(1 : n - 2) ./ (h(1 : n - 2) + h(2 : n - 1));
    lambda(2 : n - 1) = h(2 : n - 1) ./ (h(1 : n - 2) + h(2 : n - 1));
    d1_f(2 : n) = (y(2 : n) - y(1 : n - 1)) ./ h(1 : n - 1);
    d2_f(3 : n) = (d1_f(3 : n) - d1_f(2 : n - 1)) ./ (h(1 : n - 2) + h(2 : n - 1));
    d(2 : n - 1) = 6 * d2_f(3 : n);
    
    switch cond_type
        case 1
            lambda(1) = 1;
            d(1) = 6 / h(1) * (d1_f(2) - cond_v(1));
            mu(n) = 1;
            d(n) = 6 / h(n - 1) * (cond_v(2) - d1_f(n));
        case 2
            lambda(1) = 0;
            mu(n) = 0;
            d(1) = 2 * cond_v(1);
            d(n) = 2 * cond_v(2);
        case 3
            lambda(n) = h(1) / (h(n - 1) + h(1));
            mu(n) = 1 - lambda(n);
            d(n) = 6 * (d1_f(2) - d1_f(n)) / (h(1) + h(n - 1));
            d(1) = 0;
        otherwise
            throw(MException('Zhou:invalidArgument', 'Invalid argument for function spline_zhou'));
    end
    
    if cond_type <= 2
        A = 2 * eye(n);
        A = A + [zeros(n - 1, 1), lambda(1 : n - 1) .* eye(n - 1); zeros(1, n)];
        A = A + [zeros(1, n); mu(2 : n) .* eye(n - 1), zeros(n - 1, 1)];
    else
        B = 2 * eye(n - 1);
        B = B + [zeros(n - 2, 1), lambda(2 : n - 1) .* eye(n - 2); zeros(1, n - 1)];
        B = B + [zeros(1, n - 1); mu(3 : n) .* eye(n - 2), zeros(n - 2, 1)];
        B(1, n - 1) = mu(2);
        B(n - 1, 1) = lambda(n);
        A = [zeros(1, n); zeros(n - 1, 1), B];
        A(1, 1) = 1;
        A(1, n) = -1;
    end
    
    M = (A \ d')';
    j = discretize(xq, x);
    yq = M(j) .* (x(j + 1) - xq) .^ 3 ./ (6 * h(j)) + M(j + 1) .* (xq - x(j)) .^ 3 ./ (6 * h(j)) ...
        + (y(j) - M(j) .* h(j) .^ 2 ./ 6) .* (x(j + 1) - xq) ./ h(j) ...
        + (y(j + 1) - M(j + 1) .* h(j) .^ 2 ./ 6) .* (xq - x(j)) ./ h(j);
end