%% Задание 1
% Разложите функцию 1/(1+x) в ряд Тейлора 
% и представьте результат в красивом виде.
disp("Задание 1")
syms x;
f = str2sym('1/(1+x)');
pretty(taylor(f))

%% Задание 2
% Разложите функцию 1/(x+y) в ряд Тейлора 
% c 7 членами разложения сначала по x, затем – по y.
disp("Задание 2")
syms x y;
f = str2sym('1/(x+y)');
pretty(taylor(f,x,"Order",7))
pretty(taylor(f,y,"Order",7))

%% Задание 3
% Разложите в ряд Тейлора функцию x*sin(x) c 
% 10 членами разложения в окрестности x=2.
disp("Задание 3")
syms x;
f = str2sym('x*sin(x)');
pretty(taylor(f,x,2,"Order",10))

%% Задание 4
% Найдите суммы:
disp("Задание 4")

disp("Сумма (1) : ")
syms k;
symsum(str2sym('(-1)^k/k^2'),k,1,Inf)

disp("Сумма (2) : ")
syms k;
symsum(str2sym('(-1)^k*(x^(2*k+1))/factorial(2*k+1)'),k,0,Inf)

%% Задание 5
% Определите, сходится ли ряд, сумма которого 
% задана формулой (1/2)*(1-(1/3)^n). Найдите эту сумму.
disp("Задание 5")

% если lim(row_n) не -> 0 при n -> Inf, 
% то ряд (row_n) расходится
syms n;
lim = limit((1/2)*(1-(1/3)^n),n,Inf)
if (lim == 0)
    disp("lim = 0");
    disp("Ряд сходится");
else
    disp("lim != 0");
    disp("Ряд расходится");
end


%% Задание 6
% Создайте функцию, которая строит в одной 
% системе координат график последовательности 
% членов ряда и график последовательности 
% частичных сумм ряда; входные параметры функции 
% – формула общего члена последовательности и 
% число рассматриваемых членов; выходные параметры 
% – значение суммы. Примените эту функцию для 
% исследования следующих рядов: 
disp("Задание 6")
syms n;
fun6(str2sym('0.3^n'),15);
symsum(str2sym('0.3^n'),n,1,Inf)
disp("(1) - сходится")

fun6(str2sym('1.5^n'),15);
symsum(str2sym('1.5^n'),n,1,Inf)
disp("(2) - расходится")

fun6(str2sym('1/n'),15);
symsum(str2sym('1/n'),n,1,Inf)
disp("(3) - расходится")

fun6(str2sym('1/sqrt(n)'),15);
symsum(str2sym('1/sqrt(n)'),n,1,Inf)
disp("(4) - расходится")

fun6(str2sym('1/(n^2)'),15);
symsum(str2sym('1/(n^2)'),n,1,Inf)
disp("(5) - сходится")

fun6(str2sym('1/(n^2+2*n)'),15);
symsum(str2sym('1/(n^2+2*n)'),n,1,Inf)
disp("(6) - сходится")


%% Функция для задания 6
function f = fun6(row_n, count)
xn = 1:count;
yn = subs(row_n, 'n', xn);

figure("Name","Задание 6");
hold on;
grid on;

plot(xn,yn)

partSums = zeros(count,1);
for j = 1:count
    partSum = subs(row_n, 'n', 1);
    for i=2:1:j
        partSum = partSum + subs(row_n, 'n', i);
    end
    partSums(j) = partSum; 
end 
plot(xn,partSums)
end
