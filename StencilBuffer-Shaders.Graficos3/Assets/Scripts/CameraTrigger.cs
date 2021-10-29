using UnityEngine;

public class CameraTrigger : MonoBehaviour
{
    [SerializeField] AudioSource prevSource;
    [SerializeField] LayerMask layerToCheck;

    private void OnTriggerEnter(Collider other)
    {
        if(MyUtilities.Contains(layerToCheck, other.gameObject.layer))
        {
            if (prevSource != null)
                prevSource.Stop();

            AudioSource source = other.GetComponent<AudioSource>();
            source.Play();
            prevSource = source;
        }
    }
}