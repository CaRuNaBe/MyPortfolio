/**
 * @file CrystalPstEffect.hlsl
 * @brief クリスタルポストエフェクトのhlslファイル
 * @author 阿部健太郎
 * @date September
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
sampler2D _NormalMap;

v2f vert(appdata v)
{
    v2f o;
    o.vertex = UnityObjectToClipPos(v.vertex);
    o.uv = v.uv;
    return o;
}

float4 frag(v2f i) : SV_Target
{
    half3 normalmap = tex2D(_NormalMap, i.uv); //設定したノーマルマップのuv座標からrgb情報を取得
    //-の値が入るのを阻止するためunityでは0.5を足しているため引いてr値とg値を取得
    float r = (normalmap.r) - 0.5;
    float g = (normalmap.g) - 0.5;
    float2 v2uv = i.uv + float2(r, g);
    
    float4 col = tex2D(_MainTex, v2uv);

    UNITY_APPLY_FOG(i.fogCoord, col);
    return col;
}