using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FloatToInt : MonoBehaviour
{
    public int x;
    public int y;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        x = Mathf.RoundToInt(transform.position.x);
        y = Mathf.RoundToInt(transform.position.y);
    }
}
