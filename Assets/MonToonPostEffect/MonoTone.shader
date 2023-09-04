 Shader"Custom/MonoTone"
{
    Properties 
    {
        _MainTex("MainTex", 2D) = ""{}
    }

    SubShader 
    {
        Pass 
        {
CGPROGRAM
#include "MonoTone.hlsl"
ENDCG
        }
    }
}