%% Задание 1
% Постройте график функции 
% f = exp(-x)*sqrt((x^2+1)/(x^4+0.2)) 
% на интервале [0, 5] с шагом 0.05, сделав 
% из неё файл-функцию myfun1
figure("Name", "Задание 1", "NumberTitle","off");
hold on;
grid on;
x = (0:0.05:5);
y = myfun1(x);
plot(x,y);

%% Задание 2
% Постройте графики функции из п.1 на одних 
% осях, используя plot и fplot. Добавьте в 
% myfun1 комментарии на H1-line и убедитесь, 
% что help и lookfor выдают нужную информацию 
% по myfun1.
figure("Name", "Задание 2", "NumberTitle","off");
hold on;
grid on;
x = (0:0.05:5);
y = myfun1(x);
plot(x,y);
fplot(@myfun1, [0 5]);
help myfun1
lookfor difficult 

%% Задание 3
% Напишите функцию, вычисляющую сумму всех 
% элементов вектора с нечётными индексами.
disp("Задание 3");
example = [1 2 3 4 5];
res = myfun3(example)


%% Задание 4
% Создайте функцию myfun2, содержащую функцию 
% f(x) для решения уравнения 
% sin(x) – x^2*cos(x) = 0 на интервале 
% [-5; 5]. Перед использованием fzero 
% постройте график с помощью fplot с сеткой, 
% и найдите с помощью fzero все 4 корня уравнения, 
% задавая начальные приближения х0 в соответствии 
% с графиком.
figure("Name", "Задание 4", "NumberTitle","off");
hold on;
grid on;
fplot(@myfun2, [-5 5]);
text(-4.8, -0.5,"корень вблизи x=-5");
text(-2.5, 1,"корень вблизи x=-2");
text(-0.25, -0.5,"корень x=0");
text(3.5, -0.25,"корень вблизи x=5");

disp("Задание 4");
x1 = fzero(@myfun2, -5)
x2 = fzero(@myfun2, -2)
x3 = fzero(@myfun2, 0)
x4 = fzero(@myfun2, 5)

%% Задание 5
% Найдите все корни полинома 
% x^9+3x^4+x^3-10x^2-x+1024 и вычислите 
% значение полинома от получившегося 
% вектора его корней.
disp("Задание 5")
p = [1 0 0 0 0 3 1 -10 -1 1024];
rt = roots(p)
polyval(p, rt)

%% Задание 6
% Найдите все локальные минимумы функции 
% y = e^(x^2)+sin3πx, задав её с помощью 
% inline. Постройте график функции с помощью 
% fplot, чтобы знать интервалы и начальные 
% точки поиска.
figure("Name", "Задание 6", "NumberTitle","off");
hold on;
grid on;
syms x;
func6 = inline('exp(x.^2)+sin(3*pi*x)');
fplot(func6(x), [-1.5 1.5]);
x1 = fminbnd(func6, -1, -0.5)
x2 = fminbnd(func6, -0.5, 0)
x3 = fminbnd(func6, 0, 1)
x4 = fminbnd(func6, 1, 1.5)

%% Задание 7
% Найдите все локальные минимумы для функции 
% y = x^2+1. (задайте анонимную функцию, fplot).
figure("Name","Задание 7", "NumberTitle","off");
hold on;
grid on;
func7 = @(x) x^2 + 1;
fplot(func7)
fminbnd(func7, -1.5, 1.5)

%% Задание 8
figure("Name","Задание 8");
hold on;
grid on;
[X,Y] = meshgrid(0:0.01:2);
Z = sin(pi*X).*sin(pi*Y);
[CMatr, h] = contour(X,Y,Z,[-0.96,-0.9,-0.8,-0.5,-0.1,0.1,0.5,0.8,0.9,0.96]);
clabel(CMatr, h)
colormap("gray")
M = fminsearch(@ftest2, [1.4, 0.6])
[M, f] = fminsearch(@ftest2, [1.4 0.6])
figure("Name","Задание 8");
hold on;
grid on;
surf(X,Y,Z);
shading interp;
light;
view(17,19);

%% Функции

% Функция к заданию 3
function f = myfun3(x)
f = x(1:2:end);
end

% Функция к заданию 4
function f = myfun2(x)
f = sin(x)-x.^2.*cos(x);
end

% Функция к заданию 8
function f = ftest2(v)
x = v(1);
y = v(2);
f = sin(pi*x).*sin(pi*y);
end