%% Задание 1
% Перемножьте полиномы x^5+x^4+x+3 и 
% x^3+2x^2+x-10. Ответ напишите с 
% помощью disp в том же виде, что и 
% полиномы в этом задании (а не с 
% помощью вектора коэффициентов).
disp("Задание 1");
p = [1 1 1 0 0 0];
q = [0 0 1 2 1 -10];
res = conv(p, q);
disp(poly2sym(res))

%% Задание 2
% Найдите частное от деления полинома 
% x^8+x^5+x^2-1 на полином x^3+2x-1. 
% Ответ напишите с помощью disp в том 
% же виде, что и полиномы в этом задании 
% (а не с помощью вектора коэффициентов).
disp("Задание 2");
p = [1 0 0 1 0 0 1 0 -1];
q = [1 0 2 -1];
[d, r] = deconv(p, q);
disp(poly2sym(d))

%% Задание 3
% Найдите остаток от деления полинома 
% x^7+x^5+x^4-3x^3-2x^2-16x-1 на полином 
% x^3-116x+1. Ответ напишите с помощью 
% disp в том же виде, что и полиномы в 
% этом задании.
disp("Задание 3");
p = [1 0 1 1 -3 -2 -16 -1];
q = [1 0 -116 1];
[d, r] = deconv(p, q);
disp(poly2sym(r))
 
%% Задание 4
% Сложите полиномы x^9+x^6+4x^5+2x^4+3x^3+x+3 
% и 3x^5+2x^2-3x-9. Ответ напишите с помощью 
% disp в том же виде, что и полиномы в этом 
% задании (а не с помощью вектора коэффициентов).
disp("Задание 4");
p = [1 0 0 1 4 2 3 0 1 3];
q = [0 0 0 0 3 0 0 2 -3 -9];
disp(poly2sym(p+q))

%% Задание 5
% Найдите разность полиномов 
% x^8+2x^7+4x^4+2x^3+3x+3 и x^9+2x. 
% Ответ напишите с помощью disp в том 
% же виде, что и полиномы в этом задании 
% (а не с помощью вектора коэффициентов).
disp("Задание 5");
p1 = [0 1 2 0 0 4 2 0 3 3];
p2 = [1 0 0 0 0 0 0 0 2 0];
disp(poly2sym(p1-p2))

%% Задание 6
% Найдите производную от полинома 
% 2x^6+3x^5+x^3-10x^2-x+1024. Ответ 
% напишите сами знаете в каком виде.
disp("Задание 6");
p = [2 3 0 1 -10 -1 1024];
disp(poly2sym(polyder(p)))

%% Задание 7
% Дана табличная функция, заданная точками 
% x = [0.1 0.3 0.4 0.6 0.7 0.9 1.0 1.3 1.6 2.0] 
% и у = [-3 -5 -2 -1 0 1 3.5 6 2.5 8]. Приблизьте 
% её методом наименьших квадратов полиномами 
% 3, 4, 5, 6 и 7 степени. Отобразите её и 
% приближения на графике в одном окне 
% (всего 6 графиков). Подпишите легенду, 
% отражающую саму функцию и степень полинома 
% для каждого приближения.
x = [0.1 0.3 0.4 0.6 0.7 0.9 1.0 1.3 1.6 2.0];
y = [-3 -5 -2 -1 0 1 3.5 6 2.5 8];
figure("Name","Задание 7","NumberTitle","off")
grid on;
hold on;

plot(x,y,linewidth=3);

p3 = polyfit(x,y,3);
p4 = polyfit(x,y,4);
p5 = polyfit(x,y,5);
p6 = polyfit(x,y,6);
p7 = polyfit(x,y,7);

xi = 0.1:0.01:2.0;

fun_p3 = polyval(p3, xi);
fun_p4 = polyval(p4, xi);
fun_p5 = polyval(p5, xi);
fun_p6 = polyval(p6, xi);
fun_p7 = polyval(p7, xi);

plot(xi,fun_p3,"g");
plot(xi,fun_p4,"y");
plot(xi,fun_p5,"r");
plot(xi,fun_p6,"k");
plot(xi,fun_p7,"magenta")
legend("table function", "3", "4", "5", "6", "7", Location="best");

%% Задание 8
% Для той же функции из п. 7 используйте 4 типа 
% интерполяции сплайнами (всего должно быть 
% 5 графиков в одном окне с легендой, отражающей 
% тип приближения). Промежуточные точки задайте 
% от x(1) до x(10) с шагом 0.01.
x = [0.1 0.3 0.4 0.6 0.7 0.9 1.0 1.3 1.6 2.0];
y = [-3 -5 -2 -1 0 1 3.5 6 2.5 8];
figure("Name","Задание 8","NumberTitle","off")
grid on;
hold on;

plot(x,y,linewidth=3);

xi = x(1):0.01:x(end);

ynear = interp1(x,y,xi,'nearest');
ylinear = interp1(x,y,xi,'linear');
yspline = interp1(x,y,xi,'spline');
ypchip = interp1(x,y,xi,'pchip');

plot(xi,ynear,"g");
plot(xi,ylinear,"y");
plot(xi,yspline,"r");
plot(xi,ypchip,"k");
legend("table function", "nearest", "linear", "spline", "pchip", Location="best");

%% Задание 9
% Для функции 
% z=sin(3pix)*sin(3piy)*e^(-x^2-y^2) 
% на области x,y=0:1 с шагом 0.2 
% постройте в 5 различных областях 
% одного окна сначала саму функцию 
% (surfl), а затем в остальных областях 
% – 4 приближения всевозможными способами 
% (nearest, bilinear, bicubic, spline). 
% Для промежуточных значений используйте 
% шаг 0.02 в той же области x,y. Подпишите 
% (title), где какое приближение. Помедитируйте 
% над результатом. Вспомните antialiasing, 
% 3D-компьютерные игры.
figure("Name","Задание 9","NumberTitle","off")
[x,y] = meshgrid(0:0.2:1);
z = sin(3*pi*x).*sin(3*pi*y).*exp(-x.^2-y.^2);
subplot(2,3,1)
grid on;
hold on;
surf(x,y,z);
title("table function");
view(125,21);

subplot(2,3,2);
grid on;
hold on;
[xi,yi] = meshgrid(0:0.02:1);
znear = interp2(x,y,z,xi,yi,"nearest");
surf(xi,yi,znear);
title("nearest");
view(125,21);

subplot(2,3,3);
grid on;
hold on;
[xi,yi] = meshgrid(0:0.02:1);
znear = interp2(x,y,z,xi,yi,"linear");
surf(xi,yi,znear);
title("bilinear");
view(125,21);

subplot(2,3,4);
grid on;
hold on;
[xi,yi] = meshgrid(0:0.02:1);
znear = interp2(x,y,z,xi,yi,"cubic");
surf(xi,yi,znear);
title("bicubic");
view(125,21);

subplot(2,3,5);
grid on;
hold on;
[xi,yi] = meshgrid(0:0.02:1);
znear = interp2(x,y,z,xi,yi,"spline");
surf(xi,yi,znear);
title("spline");
view(125,21);
