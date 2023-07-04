%snakeSegmentSensor(snakeSegment,objectIndex(Index),floatToInt(x(Value))).
%snakeSegmentSensor(snakeSegment,objectIndex(Index),floatToInt(y(Value))).
%foodSensor(food,objectIndex(Index),floatToInt(x(Value))).
%foodSensor(food,objectIndex(Index),floatToInt(y(Value))).
%wallLow(wall,objectIndex(Index),floatToInt(y(Value))).
%wallUp(wall,objectIndex(Index),floatToInt(y(Value))).
%wallRight(wall,objectIndex(Index),floatToInt(x(Value))).
%wallLeft(wall,objectIndex(Index),floatToInt(x(Value))).
%snakeSensor(snake,objectIndex(Index),floatToInt(x(Value))).
%snakeSensor(snake,objectIndex(Index),floatToInt(y(Value))).

direction(0,1).
direction(1,0).
direction(-X,-Y) :- direction(X,Y).


food(X,Y) :- foodSensor(food,objectIndex(Index),floatToInt(y(Y))), foodSensor(food,objectIndex(Index),floatToInt(x(X))).
left_bound(X) :- wallLeft(wall,objectIndex(Index),floatToInt(x(X))).
right_bound(X) :- wallRight(wall,objectIndex(Index),floatToInt(x(X))).
up_bound(Y) :- wallUp(wall,objectIndex(Index),floatToInt(y(Y))).
low_bound(Y) :- wallLow(wall,objectIndex(Index),floatToInt(y(Y))).

snake(X,Y) :- snakeSensor(snake,objectIndex(Index),floatToInt(x(X))), snakeSensor(snake,objectIndex(Index),floatToInt(y(Y))).
snake_segments(X,Y) :- snakeSegmentSensor(SnakeSegment,objectIndex(Index),floatToInt(x(X))), snakeSegmentSensor(SnakeSegment,objectIndex(Index),floatToInt(y(Y))).

{next_direction(X,Y) : direction(X,Y)} = 1.
next_position(X,Y) :- snake(Xs,Ys), next_direction(Xd,Yd), X=Xs+Xd, Y=Ys+Yd.

:- snake_segments(X,Y), next_position(X, Y).

:- next_position(X,Y), X<X1, left_bound(X1).
:- next_position(X,Y), X>X1, right_bound(X1).
:- next_position(X,Y), Y<Y1, low_bound(Y1).
:- next_position(X,Y), Y>Y1, up_bound(Y1).


closer_x :- food(Xf,Yf), next_position(Xs,Ys), snake(X1,Y1), &abs(Xs-Xf; Dx), &abs(X1-Xf; Dx1), Dx<Dx1.
closer_y :- food(Xf,Yf), next_position(Xs,Ys), snake(X1,Y1), &abs(Ys-Yf; Dy), &abs(Y1-Yf; Dy1), Dy<Dy1.

:~ not closer_x. [1@1]
:~ not closer_y. [1@1]

setOnActuator(snakeActuator(snake,objectIndex(Index),snake(dirx(X)))) :-objectIndex(snakeActuator, Index), next_direction(X,_).
setOnActuator(snakeActuator(snake,objectIndex(Index),snake(diry(Y)))) :-objectIndex(snakeActuator, Index), next_direction(_,Y).