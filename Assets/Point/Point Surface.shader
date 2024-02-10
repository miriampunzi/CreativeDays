Shader "Graph/Point Surface"
{
    Properties {
		_Smoothness ("Smoothness", Range(0,1)) = 0.5
	}

    SubShader {
        CGPROGRAM
        
        #pragma surface ConfigureSurface Standard fullforwardshadows    // generate a surface shader with standard lighting and full support for shadows
        #pragma target 3.0  // sets a minimum for the shader's target level and quality

        struct Input
        {
            float3 worldPos; // It will contain the world position of what gets rendered.
        };

        float _Smoothness;

        void ConfigureSurface(Input input, inout SurfaceOutputStandard surface)     // inout keyword:  indicates that it's both passed to the function and used for the result of the function.
        {
            //surface.Albedo = input.worldPos * 0.5 + 0.5;
            //surface.Albedo.rg = input.worldPos.xy * 0.5 + 0.5;
            // since all cubes has Z coordinates close to 0, all blue colors are set to 0.5.
            // So, only considering rg and xy, the blue component stays to 0
            surface.Smoothness = _Smoothness;
            surface.Albedo = saturate(input.worldPos * 0.5 + 0.5);
}

		ENDCG
    }

    FallBack "Diffuse"
}
