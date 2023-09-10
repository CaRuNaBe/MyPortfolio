/**
 * @file CrystalPstEffect.hlsl
 * @brief �N���X�^���|�X�g�G�t�F�N�g��hlsl�t�@�C��
 * @author ���������Y
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
    half3 normalmap = tex2D(_NormalMap, i.uv); //�ݒ肵���m�[�}���}�b�v��uv���W����rgb�����擾
    //-�̒l������̂�j�~���邽��unity�ł�0.5�𑫂��Ă��邽�߈�����r�l��g�l���擾
    float r = (normalmap.r) - 0.5;
    float g = (normalmap.g) - 0.5;
    float2 v2uv = i.uv + float2(r, g);
    
    float4 col = tex2D(_MainTex, v2uv);

    UNITY_APPLY_FOG(i.fogCoord, col);
    return col;
}