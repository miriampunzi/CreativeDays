using UnityEngine;

public class Graph : MonoBehaviour
{
    [SerializeField]
    Transform pointPrefab;

    [SerializeField, Range(10, 100)]
    int resolution = 10;

    Transform[] points;

    void Awake()
    {
        points = new Transform[resolution];

        float step = 2f / resolution;
        var position = Vector3.zero;
        var scale = Vector3.one * step;

        for (int i = 0; i < points.Length; i++)
        {
            Transform point = points[i] = Instantiate(pointPrefab);

            position.x = (i + 0.5f) * step - 1f;
            point.localPosition = position;
            point.localScale = scale;

            point.SetParent(transform, false);
        }
    }

    private void Update()
    {
        float time = Time.time; // Because the value of Time.time is the same for each iteration of the loop we can hoist the property invocation outside of it.

        for (int i = 0; i < points.Length; i++)
        {
            Transform point = points[i];
            Vector3 position = point.localPosition;
            position.y = Mathf.Sin(Mathf.PI * (position.x + time));
            point.localPosition = position;
        }
    }
}