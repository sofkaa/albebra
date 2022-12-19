function prime_numbers %main function
  clear;
  clc;

  syms n;
  syms b;
  NN = 128;
  p = simple_list(NN)
  n = 0;
  k = randi([5 20]);

  arr(1) = 2;
  deg(1) = 20;

  for i= 2 : k
    arr(i) = p(randi([1 32]));
    deg(i) = randi([18 25]);
  endfor

  el = max(arr);

  for i = 1 : k
    n = n + arr(i)^deg(i);
  endfor

  while((n > 2^128) && (n < 2^123))
    k = randi([5 10]);
    arr(1) = 2;
    deg(1) = 20;
    for i= 2 : k
      arr(i) = p(randi([1 32]));
     deg(i) = randi([18 25]);
    endfor
    el = max(arr);
    n = 0;
    for i = 1 : k
     n = n + arr(i)^deg(i);
    endfor
    log2(n);
  endwhile

  n = n+1;
  answer = 0;

  for a = 2 : ceil(log2(n))
    if (mod(a^(n-1), n) == 1)
      ans = 1;
      for i = 1 : k
        if (mod(a^((n-1) / p(i)), n) == 1)
          ans = 0;
        endif
      endfor
      if (ans == 1)
        answer = a;
      endif
    endif
  endfor

  if (answer != 0)
    disp(sym(n));
    disp("простое");
  else
   disp(sym(n));
   disp("НЕ простое");
  endif
  pollard_alg(n, round(log2(n)));
endfunction

function arr = simple_list (N) % ищем простые числа в диапазоне 2 - 128
  arr = zeros(N);
  for k = 2 : N
      for j = 2 : N
      if (~mod(k, j))
      break
    endif
  endfor
  if (j > (k / j))
    arr(j) = k;
  endif
  endfor
  arr(arr == 0) = [];
endfunction

function pollard_alg(n, N)
  res = 0;
  a = floor(n / 2);
  for i = 1 : N
    b = mod(a^factorial(i)-1, n);
    if ((gcd(b, n) != 1) && (gcd(b, n) != n))
      res = 1;
      sym(b)
    endif
  endfor
  if(res == 0)
    1
  endif
endfunction

