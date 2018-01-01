function ret = Romberg(f, a, b, n, eps)
   if nargin < 5
       eps = 0;
   end
   T = zeros(n + 1, n + 1);
   h = b - a;
   T(1, 1) = h / 2. * [f(a) + f(b)];
   for k = 1 : n
       h = h / 2.;
       T(1, k + 1) = T(1, k) / 2.;
       for x = a + h : h * 2. : b - h
           T(1, k + 1) = T(1, k + 1) + h * f(x);
       end
       for i = 1 : k
           T(i + 1, k - i + 1) = (4^i * T(i, k - i + 2) - T(i, k - i + 1)) / (4^i - 1);
       end
       if abs(T(k + 1, 1) - T(k, 1)) < eps
           ret = T(k + 1, 1);
           break;
       end
       if k == n
           ret = T(k + 1, 1);
       end
   end
end