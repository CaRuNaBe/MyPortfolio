using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IcosahedronGenerator : MonoBehaviour
{
    // オブジェクトを回転させる速度（度/秒）
    public float rotationSpeed = 30.0f;
    private void Start()
    {
        MeshFilter meshFilter = gameObject.AddComponent<MeshFilter>();
        MeshRenderer meshRenderer = gameObject.AddComponent<MeshRenderer>();

        Mesh mesh = new Mesh();
        meshFilter.mesh = mesh;

        Vector3[] vertices = new Vector3[12];
        float phi = (1.0f + Mathf.Sqrt(5.0f)) / 2.0f;

        vertices[0] = new Vector3(-1, phi, 0);
        vertices[1] = new Vector3(1, phi, 0);
        vertices[2] = new Vector3(-1, -phi, 0);
        vertices[3] = new Vector3(1, -phi, 0);

        vertices[4] = new Vector3(0, -1, phi);
        vertices[5] = new Vector3(0, 1, phi);
        vertices[6] = new Vector3(0, -1, -phi);
        vertices[7] = new Vector3(0, 1, -phi);

        vertices[8] = new Vector3(phi, 0, -1);
        vertices[9] = new Vector3(phi, 0, 1);
        vertices[10] = new Vector3(-phi, 0, -1);
        vertices[11] = new Vector3(-phi, 0, 1);

        int[] triangles = new int[]{
            0, 11, 5,
            0, 5, 1,
            0, 1, 7,
            0, 7, 10,
            0, 10, 11,
            1, 5, 9,
            5, 11, 4,
            11, 10, 2,
            10, 7, 6,
            7, 1, 8,
            3, 9, 4,
            3, 4, 2,
            3, 2, 6,
            3, 6, 8,
            3, 8, 9,
            4, 9, 5,
            2, 4, 11,
            6, 2, 10,
            8, 6, 7,
            9, 8, 1
        };

        mesh.vertices = vertices;
        mesh.triangles = triangles;

        mesh.RecalculateNormals();
    }


    void Update()
    {
        // 現在の回転を取得
        Quaternion currentRotation = transform.rotation;

        // 回転を更新
        float angle = rotationSpeed * Time.deltaTime;
        Quaternion deltaRotation = Quaternion.Euler(0, angle, 0);
        Quaternion newRotation = currentRotation * deltaRotation;

        // オブジェクトの回転を設定
        transform.rotation = newRotation;
    }
}
