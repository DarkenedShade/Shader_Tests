Shader "Custom/Tutorials/2 - Lambert"
{
	Properties
	{
		_Color("Color",Color) = (1.0,1.0,1.0)
	}
	SubShader
	{
		Pass
		{
			Tags{"LightMode" = "ForwardBase"}
			CGPROGRAM
			//pragmas
			#pragma vertex vert
			#pragma fragment frag

			//user defined variables
			uniform float4 _Color;

			//unity defined variables
			uniform float4 _LightColor0;

			//base input struct
			struct VertexInput
			{
				float4 vertex:POSITION;
				float3 normal:NORMAL;
			};

			struct VertexOutput
			{
				float4 pos:SV_POSITION;
				float col: COLOR;
			};

			//vertex function
			VertexOutput vert(VertexInput vIn)
			{
				VertexOutput vOut;

				float3 normalDirection = normalize(mul(float4(vIn.normal,0.0),_World2Object).xyz);
				float3 lightDirection;
				float atten = 1.0;

				lightDirection = normalize(_WorldSpaceLightPos0.xyz);
				float3 diffuseReflection = atten * _LightColor0.xyz * max(0.0, dot(normalDirection, lightDirection));
				float3 lightFinal = diffuseReflection + UNITY_LIGHTMODEL_AMBIENT.xyz;

				vOut.col = float4(lightFinal * _Color.rgb,1.0);
				vOut.pos = mul(UNITY_MATRIX_MVP,vIn.vertex);
				return vOut;
			}

			float4 frag(VertexOutput i):COLOR
			{
				return i.col;
			}

			ENDCG
		}
	}
	//Fallback "Diffuse"
}