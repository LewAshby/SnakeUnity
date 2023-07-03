using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class Snake : MonoBehaviour
{
    private Vector2 _direction = Vector2.right;
    private List<Transform> _segments = new List<Transform>();
    public Transform segmentPrefab;
    public int initialSize = 4;
    TextMeshProUGUI score;
    private float speed_factor = 0.1f;
    public int dir_x;
    public int dir_y;
    private Vector2 input;

    // Start is called before the first frame update
    void Start()
    {
        ResetState();
    }

    // Update is called once per frame
    void Update()
    {
        //if (_direction.x != 0f)
        //{
        //    if (Input.GetKeyDown(KeyCode.UpArrow))
        //    {
        //        input = Vector2.up;
        //    }
        //    else if (Input.GetKeyDown(KeyCode.DownArrow))
        //    {
        //        input = Vector2.down;
        //    }
        //}
        //else if (_direction.y != 0f)
        //{
        //    if (Input.GetKeyDown(KeyCode.LeftArrow))
        //    {
        //        input = Vector2.left;
        //    }
        //    else if (Input.GetKeyDown(KeyCode.RightArrow))
        //    {
        //        input = Vector2.right;
        //    }
        //}

        input = new Vector2(dir_x, dir_y);
    }

    private void FixedUpdate()
    {
        if (input != Vector2.zero)
        {
            _direction = input;
        }

        for (int i = _segments.Count - 1; i > 0; i--)
        {
            _segments[i].position = _segments[i-1].position;
        }

        this.transform.position = new Vector2(
            Mathf.Round(this.transform.position.x) + _direction.x,
            Mathf.Round(this.transform.position.y) + _direction.y
        );
    }

    private void Grow()
    {
        Transform segment = Instantiate(this.segmentPrefab);
        segment.position = _segments[_segments.Count - 1].position;

        _segments.Add(segment);
        score.text = $"Score: {_segments.Count - initialSize}";

        if(_segments.Count % 10 == 0)
        {
            speed_factor += 0.1f;
        }

    }

    private void ResetState()
    {
        for(int i = 1; i < _segments.Count; i++)
        {
            Destroy(_segments[i].gameObject);
        }

        _segments.Clear();
        _segments.Add(this.transform);

        for (int i = 1; i < this.initialSize; i++)
        {
            _segments.Add(Instantiate(this.segmentPrefab));
        }

        this.transform.position = Vector3.zero;

        if (score == null)
        {
            score = GameObject.Find("Score").GetComponent<TextMeshProUGUI>();
        }
        score.text = $"Score: 0";
    }

    private void OnTriggerEnter2D(Collider2D collision)
    {
        if (collision.CompareTag("Food"))
        {
            Grow();
        }

        if (collision.CompareTag("Obstacle"))
        {
            ResetState();
        }
    }

}
