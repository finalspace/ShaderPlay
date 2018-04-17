// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "C1/Transparent"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_TextureSample0("Texture Sample 0", 2D) = "bump" {}
		_Distortion("Distortion", Range( 0 , 1)) = 0.1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Transparent+0" }
		Cull Back
		GrabPass{ "_GrabTexture" }
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float4 screenPos;
			float2 uv_texcoord;
		};

		uniform sampler2D _GrabTexture;
		uniform sampler2D _TextureSample0;
		uniform float4 _TextureSample0_ST;
		uniform float _Distortion;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPos3 = ase_screenPos;
			ase_screenPos3.xyzw /= ase_screenPos3.w;
			float2 uv_TextureSample0 = i.uv_texcoord * _TextureSample0_ST.xy + _TextureSample0_ST.zw;
			float4 screenColor1 = tex2Dproj( _GrabTexture, UNITY_PROJ_COORD( ( ase_screenPos3 + float4( ( UnpackNormal( tex2D( _TextureSample0, uv_TextureSample0 ) ) * _Distortion ) , 0.0 ) ) ) );
			o.Albedo = screenColor1.rgb;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=13101
556;509;1084;627;1358.927;227.4431;1.364908;True;False
Node;AmplifyShaderEditor.RangedFloatNode;6;-886.3575,266.9841;Float;False;Property;_Distortion;Distortion;1;0;0.1;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.SamplerNode;2;-962.5599,55.36002;Float;True;Property;_TextureSample0;Texture Sample 0;0;0;Assets/AmplifyShaderEditor/Examples/Assets/Textures/SceneTextures/BrushedMetalNormal.tif;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0.0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1.0;False;5;FLOAT3;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.ScreenPosInputsNode;3;-811.2993,-134.89;Float;False;0;False;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;5;-640.9167,158.8239;Float;False;2;2;0;FLOAT3;0.0;False;1;FLOAT;0.0,0,0;False;1;FLOAT3
Node;AmplifyShaderEditor.SimpleAddOpNode;4;-534.8591,3.460163;Float;False;2;2;0;FLOAT4;0.0,0,0;False;1;FLOAT3;0.0,0,0,0;False;1;FLOAT4
Node;AmplifyShaderEditor.ScreenColorNode;1;-369.3187,-16.39015;Float;False;Global;_GrabScreen0;Grab Screen 0;0;0;Object;-1;False;1;0;FLOAT4;0,0;False;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;0,0;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;C1/Transparent;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Back;0;0;False;0;0;Translucent;0.5;True;True;0;False;Opaque;Transparent;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;True;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;5;0;2;0
WireConnection;5;1;6;0
WireConnection;4;0;3;0
WireConnection;4;1;5;0
WireConnection;1;0;4;0
WireConnection;0;0;1;0
ASEEND*/
//CHKSM=96D98261D653FC6BFAECD66C7E3C4856F9A5D959