Shader "Custom/PropertiesBox" {
	Properties {
		_MainTex("Texture",2D) = "white"{}
		_BumpTex("Normal Map",2D) = "bump"{}
		_ColorTint("Color Tint",Color) = (1.0,1.0,1.0,1.0)
		_TintValue("Tint Intensity",Range(0.0,1.0)) = 0.5
		_Darkness("Darkness", Float) = 0.25
		_Coord("Vector coord",Vector) = (1,1,1,1)
		_Cube("Cube Map",Cube) = ""{}

		//_Color ("Color", Color) = (1,1,1,1)
		//_MainTex ("Albedo (RGB)", 2D) = "white" {}
		//_Glossiness ("Smoothness", Range(0,1)) = 0.5
		//_Metallic ("Metallic", Range(0,1)) = 0.0
	}
	SubShader {
		Tags { "RenderType"="Opaque" }
		LOD 200
		
		CGPROGRAM
		// Physically based Standard lighting model, and enable shadows on all light types
		#pragma surface surf Standard fullforwardshadows

		// Use shader model 3.0 target, to get nicer looking lighting
		#pragma target 3.0

		uniform sampler2D _MainTex;
		uniform sampler2D _BumpTex;
		uniform float4 _ColorTint;
		uniform float _TintValue;
		uniform float _Darkness;
		uniform float4 _Coord;
		uniform samplerCUBE _Cube;


		//sampler2D _MainTex;

		struct Input {
			float2 uv_MainTex;
		};

		half _Glossiness;
		half _Metallic;

		void surf (Input IN, inout SurfaceOutputStandard o) {
			// Albedo comes from a texture tinted by color
			fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _ColorTint;
			o.Albedo = c.rgb;
			// Metallic and smoothness come from slider variables
			o.Metallic = _Metallic;
			o.Smoothness = _Glossiness;
			o.Alpha = c.a;
		}
		ENDCG
	}
	FallBack "Diffuse"
}
