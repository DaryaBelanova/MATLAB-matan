%% Задание 1 
% Вычислите интеграл от функции 
% sin(x)-x^3*cos(x) на отрезке [-4, 0] 
% c точностью 1.0e-05.
disp("Задание 1")
f = @(x)sin(x)-x.^3.*cos(x);
quad(f,-4,0,1.0e-05)

%% Задание 2
% Найдите площадь фигуры, ограниченной осью x, 
% прямыми x=2 и x=5 и функцией y=x^3+1.
disp("Задание 2")
y = @(x)x.^3+1;
integral(y,2,5)

%% Задание 3 
% Вычислите двумя способами двойной интеграл от 
% функции exp(-x)*sin(y) при х от –pi до pi  
% и y от 0 до 3 .
disp("Задание 3")
f = @(x,y)exp(-x).*sin(y);
dblquad(f,-pi,pi,0,3)
integral2(f,-pi,pi,0,3)

%% Задание 4
% Вычислите объём поверхности, заданной функцией 
% z(x,y)=sin(x)*sin(y)*(1-x2)*x*(1-y) на области 
% x ϵ [-2,2], y ϵ [-2,2]. Постройте график этой 
% поверхности, поверните её на азимут 0 и угол 
% возвышения 2.
figure("Name","Задание 4", "NumberTitle","off")
f = @(x,y)sin(x).*sin(y).*(1-x.^2).*x.*(1-y);
disp("Задание 4")
integral2(f,-2,2,-2,2)

[x,y]=meshgrid(-2:0.05:2);
f = sin(x).*sin(y).*(1-x.^2).*x.*(1-y);
surf(x,y,f);
view(0,2);

%% Задание 5
% Вычислите двумя способами тройной интеграл от 
% функции exp(-x)*sin(y)*cos(z) при х 
% от –pi до pi, y от –2*pi до pi и z - от 0 до 2.
disp("Задание 5")
f = @(x,y,z)exp(-x).*sin(y).*cos(z);
triplequad(f,-pi,pi,-2*pi,pi,0,2)
integral3(f,-pi,pi,-2*pi,pi,0,2)

%% Задание 6
% Вычислите тройной интеграл от функции 
% exp(x)*(sin(y))^2+exp(-x)*(cos(y))^2+sin(y)*cos(x)*z 
% при x,y ϵ [-2pi,2pi] и z ϵ [-1,1].
disp("Задание 6")
f = @(x,y,z)exp(x).*(sin(y)).^2+exp(-x).*(cos(y)).^2+sin(y).*cos(x).*z;
integral3(f,-2*pi,2*pi,-2*pi,2*pi,-1,1)

%% Задание 7 
% Проинтегрируйте функцию y=1/x при х от 0 до 1 
% с помощью алгоритмов Симпсона, Гаусса-Лобатто 
% и Гаусса-Кронрода.
disp("Задание 7")
y = @(x)1./x;
simpson = quad(y,0,1)
gauss_lobatto = quadl(y,0,1)
gauss_kronrod = quadgk(y,0,1)

%% Задание 8
% Вычислите интеграл функции, зависящей от 
% параметров a=20 и b=7, объявив функцию анонимно: 
% a*cos(x)*x^2+b*sin(y)*y^2 при x,y ϵ [-2,2].
disp("Задание 8")
f = @(x,y,a,b)a*cos(x).*x.^2+b*sin(y).*y.^2;
integral2(@(x,y)f(x,y,20,7),-2,2,-2,2)

%% Задание 9
% Вычислите интеграл функции, зависящей от 
% параметра a=3, объявив функцию c помощью 
% inline: a*x^2+x+1 при x ϵ [0,10].
disp("Задание 9")
f = inline('a.*x.^2+x+1');
integral(@(x)f(x,3),0,10)

%% Задание 10
% Вычислите интеграл с переменным верхним 
% пределом y от функции exp(x)*(sin(x)-cos(x)) 
% и постоянным нижним пределом 0. Постройте 
% график зависимости интеграла от верхнего предела.
disp("Задание 10")
figure("Name","Задание 10", "NumberTitle","off")
hold on;
grid on;
f = @(x)exp(x).*(sin(x)-cos(x));
F = @(y)quad(f,0,y);
x = F(2)
fplot(F,[0,pi])

%% Задание 11
% Вычислите интеграл от функции 
% y=cos(x-sqrt(2))*exp(2*sin(x))-1 
% по промежутку между её двумя соседними 
% корнями, принадлежащими отрезку [0,4].
disp("Задание 11")
figure("Name","Задание 11", "NumberTitle","off")
hold on;
grid on;
y = @(x)cos(x-sqrt(2)).*exp(2*sin(x))-1;
fplot(y,[0,4])
x1 = fzero(y,[0,1])
x2 = fzero(y,[2,3])
text(x1,-0.25,"корень x1")
text(x2,-0.25,"корень x2")
quad(y,x1,x2)

%% Задание 12
% Вычислите интеграл от функции 
% y=sin(x)-x^2*(cos(x)) по промежутку 
% между её локальным максимумом и локальным 
% минимумом, абсциссы которых принадлежат 
% отрезку [-5, 0]. Постройте график этой 
% функции на указанном участке.
disp("Задание 12")
figure("Name","Задание 12", "NumberTitle","off")
hold on;
grid on;
y = @(x)sin(x)-x.^2.*(cos(x));
fplot(y,[-5,0])
% ищем точку минимума у функции 'y' с минусом - это 
% точка максимума первоначальной функции
y_reversed = @(x)-(sin(x)-x.^2.*(cos(x)));
max = fminbnd(y_reversed,-4,-3.5)
min = fminbnd(y,-2,-1)
text(max-0.25,13,"locmax")
text(min-0.25,-0.25,"locmin")
quad(y,max,min)
