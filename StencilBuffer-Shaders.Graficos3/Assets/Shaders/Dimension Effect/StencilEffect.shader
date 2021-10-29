Shader "MyShaders/StencilEffect"
{
	Properties
	{
		[IntRange] _StencilMask("Stencil Mask", Range(0, 255)) = 0
		_Color("Main Color", Color) = (1,1,1,1)
		_Texture("Basic Texture", 2D) = "white" {}
	}

	Subshader
	{
		Pass
		{
			ZWrite off
			Blend SrcAlpha OneMinusSrcAlpha

			Stencil
			{
				Ref[_StencilMask]
				Comp always
				Pass replace   // This step actually fills the stencil buffer.
			}

			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			uniform half4 _Color;
			uniform sampler2D _Texture;
			uniform float4 _Texture_ST;

			struct vertexInput
			{
				float4 vertex: POSITION;
				float4 texcoorda: TEXCOORD0;
			};

			struct vertexOutput
			{
				float4 pos : SV_POSITION;
				float4 texcoorda: TEXCOORD0;
			};

			vertexOutput vert(vertexInput v)
			{
				vertexOutput o;
				o.pos = UnityObjectToClipPos(v.vertex);
				o.texcoorda.xy = v.texcoorda + _Texture_ST.wz;
				return o;
			}

			half4 frag(vertexOutput i) : COLOR
			{
				return tex2D(_Texture,i.texcoorda) * _Color.rgba;
			}
			ENDCG
		}
	}
}