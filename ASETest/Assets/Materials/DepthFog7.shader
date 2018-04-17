// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "C1/Fog"
{
	Properties
	{
		[HideInInspector] __dirty( "", Int ) = 1
		_FogIntensity("FogIntensity", Range( 0 , 1)) = 0.5
		_FogColor("FogColor", Color) = (0,1,0.3793104,0)
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "Transparent+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		CGPROGRAM
		#include "UnityCG.cginc"
		#pragma target 3.0
		#pragma surface surf Standard alpha:fade keepalpha noshadow exclude_path:deferred noambient novertexlights nolightmap  nodynlightmap nodirlightmap 
		struct Input
		{
			float4 screenPos;
		};

		uniform float4 _FogColor;
		uniform sampler2D _CameraDepthTexture;
		uniform float _FogIntensity;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			o.Emission = _FogColor.rgb;
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float eyeDepth3 = LinearEyeDepth(UNITY_SAMPLE_DEPTH(tex2Dproj(_CameraDepthTexture,UNITY_PROJ_COORD(ase_screenPos))));
			float4 ase_screenPos2 = ase_screenPos;
			o.Alpha = ( (0.0 + (( eyeDepth3 + ( ( 1.0 - ase_screenPos2.y ) * 1.4 ) ) - 0.0) * (1.0 - 0.0) / (2.0 - 0.0)) * _FogIntensity );
		}

		ENDCG
	}
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=13101
556;509;1084;627;1277.903;1178.138;3.175193;True;False
Node;AmplifyShaderEditor.ScreenPosInputsNode;2;-938.7199,110.4867;Float;True;1;False;0;5;FLOAT4;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.OneMinusNode;10;-700.5703,121.0024;Float;False;1;0;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.ScreenDepthNode;3;-796.3075,-10.25554;Float;False;0;1;0;FLOAT4;0,0,0,0;False;1;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;8;-559.9787,160.3075;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;1.4;False;1;FLOAT
Node;AmplifyShaderEditor.SimpleAddOpNode;9;-463.228,6.11055;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.TFHCRemap;4;-196.7098,35.38145;Float;False;5;0;FLOAT;0.0;False;1;FLOAT;0.0;False;2;FLOAT;2.0;False;3;FLOAT;0.0;False;4;FLOAT;1.0;False;1;FLOAT
Node;AmplifyShaderEditor.RangedFloatNode;1;-493.7009,298.3451;Float;False;Property;_FogIntensity;FogIntensity;0;0;0.5;0;1;0;1;FLOAT
Node;AmplifyShaderEditor.ColorNode;11;-67.15437,-193.4384;Float;False;Property;_FogColor;FogColor;1;0;0,1,0.3793104,0;0;5;COLOR;FLOAT;FLOAT;FLOAT;FLOAT
Node;AmplifyShaderEditor.SimpleSubtractOpNode;5;-345.5446,101.7173;Float;False;2;0;FLOAT;1.0;False;1;FLOAT;0.0;False;1;FLOAT
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;24.16422,155.6768;Float;False;2;2;0;FLOAT;0.0;False;1;FLOAT;0.3;False;1;FLOAT
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;225.5766,21.83001;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;C1/Fog;False;False;False;False;True;True;True;True;True;False;False;False;False;False;True;False;False;Back;0;0;False;0;0;Transparent;0.5;True;False;0;False;Transparent;Transparent;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;False;0;255;255;0;0;0;0;False;0;4;10;25;False;0.5;False;0;Zero;Zero;0;Zero;Zero;Add;Add;0;False;0;0,0,0,0;VertexOffset;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;0;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0.0;False;4;FLOAT;0.0;False;5;FLOAT;0.0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0.0;False;9;FLOAT;0.0;False;10;OBJECT;0.0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;10;0;2;2
WireConnection;8;0;10;0
WireConnection;9;0;3;0
WireConnection;9;1;8;0
WireConnection;4;0;9;0
WireConnection;6;0;4;0
WireConnection;6;1;1;0
WireConnection;0;2;11;0
WireConnection;0;9;6;0
ASEEND*/
//CHKSM=71FB5DB64180B577CF58A45143B38D6F142A4BA4