using UnityEngine;

public class CameraRotate : MonoBehaviour
{
    [SerializeField] float speedRotation;

    void LateUpdate()
    {
        transform.Rotate(Vector3.up * speedRotation * Time.deltaTime); 
    }
}