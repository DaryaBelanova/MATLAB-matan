%% Задание 1
% Постройте график трёхмерной линии 
% x=e^(-|t-100|/100)*sin(t), 
% y=e^(-|t-100|/100)*cos(t), 
% z=t, t ϵ [0,100] с шагом 0.01.
figure("Name", "Задание 1", "NumberTitle","off");
title("Задание 1");
t = (0:0.01:100);
x = exp(-abs(t-100)/100).*sin(t);
y = exp(-abs(t-100)/100).*cos(t);
z = t;
plot3(x,y,z);
grid on;

%% Задание 2
% Постройте параметрически заданную поверхность, 
% определённую зависимостями 
% x(u,v)=0.5*u*cos(v), 
% y(u,v)=0.5*u*sin(v), 
% z(u,v)=u, где u,v ϵ [-4π,4π] с шагом 0,1*π 
% (v – вектор-строка, u – вектор-столбец).
figure("Name", "Задание 2", "NumberTitle","off");
title("Задание 2");
u = (-4*pi:0.1*pi:4*pi)';
v = (-4*pi:0.1*pi:4*pi);
x = 0.5*u*cos(v);
y = 0.5*u*sin(v);
z = u * ones(size(v));
surf(x,y,z);
%% Задание 3
% Постройте прозрачную каркасную поверхность 
% эллипсоида, заданного соотношениями 
% x(u,v)=cos(u)*cos(v), 
% y(u,v)=0,6*cos(u)*sin(v), 
% z(u,v)=0,8*sin(u), u,v ϵ [-2π,2π] 
% с шагом 0,1*π (v – вектор-строка, u – вектор-столбец).
figure("Name", "Задание 3", "NumberTitle","off");
title("Задание 3");
u = (-2*pi:0.1*pi:2*pi)';
v = (-2*pi:0.1*pi:2*pi);
x = cos(u)*cos(v);
y = 0.6*cos(u)*sin(v);
z = 0.8*sin(u)*ones(size(v));
mesh(x,y,z);
hidden off;

%% Задание 4
% Постройте траекторию движения точки согласно закону 
% x=ux0t, y=uy0t-g*t2/2m, 
% где ux0=0,5, uy0=0,8 и t=[0,2] 
% с шагом 0,2 с помощью quiver (см. [1], стр. 169), 
% применив 3 коэффициента масштабирования: 0, 1.5, 0.3 (3 «фиги»).
koef0 = figure("Name", "Задание 4. Коэффициент масштабирования 0", "NumberTitle","off");
koeff15 = figure("Name", "Задание 4. Коэффициент масштабирования 1.5", "NumberTitle","off");
koef03 = figure("Name", "Задание 4. Коэффициент масштабирования 0.3", "NumberTitle","off");

ux0 = 0.5;
uy0 = 0.8;
t = (0:0.2:2);
x = ux0*t;
y = uy0*t.*(1-0.5*t);
ux(1:length(x)) = ux0;
uy = uy0*(1 - t);
figure(koef0);
quiver(x, y, ux, uy, 0);
figure(koeff15);
quiver(x, y, ux, uy, 1.5);
figure(koef03);
quiver(x, y, ux, uy, 0.3);

%% Задание 5
% Отобразите  траекторию движения 
% по закону из п.4 на одной из figure п.4, 
% применив команду figure(fign) после fign=figure в п.4 
% (см. стр. 164 [1]).
koef0 = figure("Name", "Задание 5. Коэффициент масштабирования 0.3", "NumberTitle","off");
ux0 = 0.5;
uy0 = 0.8;
t = (0:0.2:2);
x = ux0*t;
y = uy0*t.*(1-0.5*t);
ux(1:length(x)) = ux0;
uy = uy0*(1 - t);
quiver(x, y, ux, uy, 0.3);
figure(koef0);
hold on;
comet(x,y);

%% Задание 6
% Постройте векторные поля для траектории из п. 4 
% с помощью compass.
figure("Name", "Задание 6", "NumberTitle","off");
ux0 = 0.5;
uy0 = 0.8;
t = (0:0.2:2);
x = ux0*t;
%y = uy0*t.*(1-0.5*t);
ux(1:length(x)) = ux0;
uy = uy0*(1 - t);
compass(ux, uy);

%% Задание 7
% То же самое с помощью feather.
figure("Name", "Задание 7", "NumberTitle","off");
ux0 = 0.5;
uy0 = 0.8;
t = (0:0.2:2);
x = ux0*t;
%y = uy0*t.*(1-0.5*t);
ux(1:length(x)) = ux0;
uy = uy0*(1 - t);
feather(ux, uy);

%% Задание 8
% Постройте внешние нормали к шару радиуса 2 
% с помощью quiver3 (см. [1], стр. 173).
figure("Name", "Задание 8", "NumberTitle","off");
u = (-pi:pi/15:pi)';
v = (-pi:pi/15:pi);
x = 2*sin(u)*cos(v);
y = 2*sin(u)*sin(v);
z = 2*cos(u)*ones(size(v));
surf(x,y,z);
[U, V, W] = surfnorm(x, y, z);
hold on;
quiver3(x ,y, z, U, V, W, 4, 'k');

%% Задание 9
% Постройте трёхмерное векторное поле 
% на гиперболическом параболоиде 
% (x^2/a^2-y^2/b^2=2z).
figure("Name", "Задание 9", "NumberTitle","off");
grid on;
hold on;
[x,y]=meshgrid(-1:0.1:1);
z = x.^2/2-y.^2/2;
surf(x,y,z);
[u, v, w] = surfnorm(x, y, z);
hold on;
quiver3(x, y, z, u, v, w, 1.5, 'k');
view(120, 30);

%% Задание 10
% То же - на двуполостном гиперболоиде 
% (x^2/a^2 +y^2/b^2 -z^2/c^2=-1).
figure("Name", "Задание 10", "NumberTitle","off");
grid on;
hold on;
[x,y]=meshgrid(-1:0.1:1);
z = sqrt(x.^2/2+y.^2/2 + 1);
surf(x,y,z);
[u, v, w] = surfnorm(x, y, z);
hold on;
quiver3(x, y, z, u, v, w, 0.5, 'k');
view(120, 30);

%% Задание 11
% То же - на параметрической поверхности: 
% x(u,v)=cos(u)*cos(v), 
% y(u,v)=sin(u)*sin(v),  
% z(u,v)=u*v, 
% u,v ϵ [0,3] с шагом 0,1.
figure("Name", "Задание 11", "NumberTitle","off");
u = (0:0.1:3)';
v = (0:0.1:3);
x = cos(u)*cos(v);
y = sin(u)*sin(v);
z = u*v;
surf(x,y,z);
[u, v, w] = surfnorm(x, y, z);
hold on;
quiver3(x, y, z, u, v, w, 0.5, 'k');

%% Задание 12
% Постройте нечто со стр. 1062 источника [1] 
% (листинг П.2) с помощью coneplot.

% Задание границ области определения вектор-функции
xL = 1; xR = 3;
yL = -1; yR = 1;
zL = 0; zR = 2;
% Генерация матриц, содержащих координаты узлов мелкой сетки
[X, Y, Z] = meshgrid(xL:0.05:xR, yL:0.05:yR, zL:0.05:zR);
% Вычисление компонент вектор-функции на этой сетке
U = X./sqrt(X.^2 + Y.^2 + Z.^2);
V = Y./sqrt(X.^2 + Y.^2 + Z.^2);
W = Z./sqrt(X.^2 + Y.^2 + Z.^2);
% Генерация матриц, содержащих координаты узлов редкой сетки
[Cx, Cy, Cz] = meshgrid(xL:(xR-xL)/3:xR, yL:(yR-yL)/3:yR, zL:(zR-zL)/7:zR);
% Создание графического окна
figure("Name", "Задание 12", "NumberTitle","off");
% Построение графического поля с увеличением автоматически
% масшабированного конуса в 4 раза и запись указателя на полученный
% полигональный объект в переменную hC
hC = coneplot(X ,Y, Z, U, V, W, Cx, Cy, Cz, 4);
% Задание зеленого цвета для граней полигонального объекта
% и скрытие ребер (выполняется для каждого конуса)
set(hC, 'FaceColor', 'g', 'EdgeColor', 'none');
% Установка пределов осей, точно соответствующих границам 
% изменения данных
axis tight;
% Задание точки обзора
view(31,28);
% Добавление света
light;
xlabel('x');
ylabel('y');
zlabel('z');
