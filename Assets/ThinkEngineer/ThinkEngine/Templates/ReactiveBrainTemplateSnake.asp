%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
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
%Actuators:
setOnActuator(snakeActuator(snake,objectIndex(Index),snake(dirx(Value)))) :-objectIndex(snakeActuator, Index), .
setOnActuator(snakeActuator(snake,objectIndex(Index),snake(diry(Value)))) :-objectIndex(snakeActuator, Index), .
