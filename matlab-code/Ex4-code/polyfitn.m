% polyfitn.m
function a = polyfitn(x, y, n)
    arr_n = 0 : n;
    d = arrayfun(@(k) calc_d(k), arr_n);
    for i = 1 : n + 1
        for j = 1 : n + 1
            G(i, j) = power_inner_product(i - 1, j - 1);
        end
    end
    a = G \ d';
    a = fliplr(a');
    function ret = power_inner_product(a, b)
        tmp = (x .^ a) .* (x .^ b);
        ret = sum(tmp);
    end
    function ret = calc_d(k)
        tmp = y .* (x .^ k); 
        ret = sum(tmp);
    end
end