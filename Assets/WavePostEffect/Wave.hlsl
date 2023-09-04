/**
 * @file wave.hlsl
 * @brief 波打つポストエフェクトのhlslファイル
 * @author 阿部健太郎
 * @date August
 */
#pragma vertex vert
#pragma fragment frag
// make fog work
#pragma multi_compile_fog
#include "UnityCG.cginc"

struct appdata
{
float4 vertex : POSITION;
float2 uv : TEXCOORD0;
};

struct v2f
{
float2 uv : TEXCOORD0;
UNITY_FOG_COORDS(1)
float4 vertex : SV_POSITION;
};

sampler2D _MainTex;
float4 _MainTex_ST;

v2f vert (appdata v)
{
v2f o;
o.vertex = UnityObjectToClipPos(v.vertex);
o.uv = TRANSFORM_TEX(v.uv, _MainTex);
UNITY_TRANSFER_FOG(o,o.vertex);
return o;
}

fixed4 frag (v2f i) : SV_Target
{

float2 v2uv = i.uv + float2(0.0, 0.1f * sin(2.0f * 3.1416 * ((_Time.y / 2.0f) - (i.uv.y / 1.0f))));
fixed4 col = tex2D(_MainTex, v2uv) ;

return col;
}