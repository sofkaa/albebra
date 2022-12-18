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
  deg(1) = 10;
  el = 2;

  num = 0;

  for i = 2 : k
    arr(i)=p(randi([1 31]));
    if (arr(i) > el)
      el = arr(i);
    endif
    deg(i)=randi([18 24]);
  endfor

  n = sym (arr(1))^(deg(1));
  num = (arr(1))^(deg(1));

  for i = 2 : k
    n = n + sym(arr(i))^(deg(i));
    num =  num + (arr(i))^(deg(i));
  endfor

  while (num < 2^123)
    n = sym (ceil(n * el));
    num = ceil(num * el);
  endwhile
  while (num > 2^128)
    n = sym (floor(n / sym(el)));
    num = floor(num / el);
  endwhile

  n = n + 1;
  num % вывод числа

  flag = 0;
  N = ceil(log2(num));
  for a = 2 : N
    for i = 1 : k
      t = a^((num-1) / p(i));
      if (mod(t, num) != 1)
        if (mod(a^(num-1), num) == 1)
          flag = 1;
        endif
      endif
    endfor
  endfor
  disp(sym(n));

  if(flag == 0)
    disp("является простым");
  else
   disp("НЕ простое");
  end

  [k1, k1um] = makenum(p, k) %как множитель p
  [k2, k2um] = makenum(p, k) %как множитель q
  n = k1 * k2 % n = pq
  num = k1um * k2um

  flag = 0;
  aum = floor(num / 2);
  a = (n-1) / 2; k = 1;
  N = ceil(log2(num));
  for i = 1 : N
    k = k * i;
    b = mod(sym(a)^(k) - 1, n);
    bum = mod(aum^k - 1, num);

    t = evklid(bum, num);
    if ((t > 1) && (t < num))
      flag = 1;
    endif
  endfor
  if (flag == 0)
    disp(1);
  else
    disp(sym(b));
    bum
  endif

end

function arr = simple_list (N) % ищем простые числа в диапазоне 2 - 128
  arr = zeros(N);
  for k = 2 : N
      for j = 2 : N
      if (~mod(k, j))
      break
    endif
  endfor
  if (j > (k/j))
    arr(j) = k;
  endif
  endfor
  arr(arr==0)=[];
endfunction

function [n, num] = makenum(p,k)
  arr(1) = 2;
  deg(1) = 10;
  el = 2;
  for i = 2 : k
    arr(i) = p(randi([1 31]));
    if (arr(i) > el)
      el = arr(i);
    endif
    deg(i) = randi([5 10]);
  endfor
  n = sym (arr(1))^(deg(1));
  num = (arr(1))^(deg(1));
  for i = 2 : k
    n = n + sym(arr(i))^(deg(i));
    num =  num + (arr(i))^(deg(i));
  endfor
endfunction

function z = evklid(a,b)
	c = a - b;
	if (b > c) evklid(b, c);
  endif
	if (c > b) evklid(c, b);
	endif
	if (c == b)
	  nod = c;
	  z = nod;
	endif
endfunction

