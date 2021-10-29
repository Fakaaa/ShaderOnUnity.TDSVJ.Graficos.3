using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public struct MyUtilities
{
    public static bool Contains(LayerMask mask, int layer)
    {
        return mask == (mask | (1 << layer));
    }

    public enum EnemyState
    {
        Idle,
        Chasing,
        Tracking,
        Placing,
        Attacking
    }
}