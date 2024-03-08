shader_type spatial;
render_mode unshaded, depth_test_disabled, cull_disabled;

uniform sampler2D _texture;

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 tex = texture(_texture, UV);
	ALBEDO = tex.rgb;
	ALPHA = tex.a;
}

