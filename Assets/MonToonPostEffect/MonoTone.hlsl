/**
 * @file MonToon.hlsl
 * @brief モノトーンポストエフェクトのhlslファイル
 * @author 阿部健太郎
 * @date August
 */
#include "UnityCG.cginc"

#pragma vertex vert_img
#pragma fragment frag

sampler2D _MainTex;//テクスチャ情報



fixed4 frag(v2f_img i) : COLOR
{
    fixed4 col = tex2D(_MainTex, i.uv);//色取得
    float gray = col.r * 0.3 + col.g * 0.6 + col.b * 0.1;//それぞれの色彩を抜いた色を取得
    col.rgb = fixed3(gray, gray, gray);//グレースケール化
    
    return col;
}