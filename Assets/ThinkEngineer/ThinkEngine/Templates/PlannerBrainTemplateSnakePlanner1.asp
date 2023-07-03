%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
%snakeSensor(snake,objectIndex(Index),floatToInt(x(Value))).
%snakeSensor(snake,objectIndex(Index),floatToInt(y(Value))).
%snakeSegmentSensor(snakeSegment,objectIndex(Index),floatToInt(x(Value))).
%snakeSegmentSensor(snakeSegment,objectIndex(Index),floatToInt(y(Value))).
%wallLow(wall,objectIndex(Index),floatToInt(y(Value))).
%wallUp(wall,objectIndex(Index),floatToInt(y(Value))).
%wallRight(wall,objectIndex(Index),floatToInt(x(Value))).
%wallLeft(wall,objectIndex(Index),floatToInt(x(Value))).
%foodSensor(food,objectIndex(Index),floatToInt(x(Value))).
%foodSensor(food,objectIndex(Index),floatToInt(y(Value))).
%For ASP programs:
% Predicates for Action invokation.
% applyAction(OrderOfExecution,ActionClassName).
% actionArgument(ActionOrder,ArgumentName, ArgumentValue).

applyAction(0, RightAction).
applyAction(1, UpAction).
applyAction(2, LeftAction).

actionArgument(1, "xPos", 12).
actionArgument(1, "yPos", 13).