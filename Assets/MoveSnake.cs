using System.Collections;
using System.Collections.Generic;
using ThinkEngine.Planning;
using UnityEngine;

public class UpActionSnake : Action
{
    public int xPos;
    public int yPos;

    public override void Do()
    {
        GameObject.Find("Snake").GetComponent<Snake>().dir_x = 0;
        GameObject.Find("Snake").GetComponent<Snake>().dir_y = 1;
    }

    public override bool Done()
    {
        return true;
    }

    public override State Prerequisite()
    {
        if (GameObject.Find("Snake").transform.position.x == xPos && GameObject.Find("Snake").transform.position.y == yPos)
        {
            return State.READY;
        }

        return State.ABORT;
    }
}
