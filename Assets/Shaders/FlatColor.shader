Shader "Custom/Tutorials/BLAH 1 - FlatColor"
{
	Properties
	{
		_Color("Color",Color) = (1.0,1.0,1.0,1.0)
		
	}

		SubShader
	{
		Pass
		{
			CGPROGRAM
			//pragmas
			#pragma vertex vert
			#pragma fragment frag

			//user defined variables
			uniform float4 _Color;

			//structs
			struct vertexInput
			{
				float4 vertex:POSITION;
			};

			struct vertexOutput
			{
				float4 pos: SV_POSITION;
			};

			//vertex function
			vertexOutput vert(vertexInput vIn)
			{
				vertexOutput vOut;
				vOut.pos = mul(UNITY_MATRIX_MVP, vIn.vertex);
				return vOut;
			}

			//fragment function
			float4 frag(vertexOutput i) : COLOR
			{
				return _Color;
			}

			ENDCG
		}
	}
}
