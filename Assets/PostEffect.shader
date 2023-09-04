Shader"Custom/monoTone"
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
#include "PostEffect.hlsl"
ENDCG
        }
    }
}