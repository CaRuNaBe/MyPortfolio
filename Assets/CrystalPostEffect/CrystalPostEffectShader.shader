Shader"CrystalPstEffectShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _NormalMap ("Normal Map", 2D) = "bump" {}
    }
    SubShader
    {
        // No culling or depth
        Cull Off

        ZWrite Off

        ZTest Always

        Pass
        {
            CGPROGRAM
            #include "CrystalPostEffect.hlsl"
            ENDCG
        }
    }
    
}
