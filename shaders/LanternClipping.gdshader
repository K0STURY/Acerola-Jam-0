shader_type spatial;
render_mode unshaded, depth_test_disabled, cull_disabled, specular_toon;

uniform sampler2D _texture;
uniform vec4 tint : source_color;

void fragment() {
	// Called for every pixel the material is visible on.
	vec4 tex = texture(_texture, UV) * tint;
	ALBEDO = tex.rgb;
	ALPHA = tex.a;
}