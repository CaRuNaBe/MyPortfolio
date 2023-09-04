/**
 * @file MonToon.hlsl
 * @brief ���m�g�[���|�X�g�G�t�F�N�g��hlsl�t�@�C��
 * @author ���������Y
 * @date August
 */
#include "UnityCG.cginc"

#pragma vertex vert_img
#pragma fragment frag

sampler2D _MainTex;//�e�N�X�`�����



fixed4 frag(v2f_img i) : COLOR
{
    fixed4 col = tex2D(_MainTex, i.uv);//�F�擾
    float gray = col.r * 0.3 + col.g * 0.6 + col.b * 0.1;//���ꂼ��̐F�ʂ𔲂����F���擾
    col.rgb = fixed3(gray, gray, gray);//�O���[�X�P�[����
    
    return col;
}