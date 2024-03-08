shader_type spatial;
render_mode unshaded;

uniform vec3 tint : source_color;
uniform float alpha = 1;

void fragment() {
	ALBEDO = tint;
	ALPHA = alpha;
}

