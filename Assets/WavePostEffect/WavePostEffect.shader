Shader"Custom/WavePostEffect"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
LOD 100
        Pass
        {
CGPROGRAM
#include "Wave.hlsl"
ENDCG
        }
    }
}
