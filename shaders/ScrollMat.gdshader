shader_type canvas_item;

uniform vec2 scrollDireciton = vec2(1.0, 0.0);
uniform float scale = 1.0;
uniform float opacity = 1;

void fragment() {
	vec2 scroll_uv = UV + (TIME * scrollDireciton);
	scroll_uv *= scale;
	COLOR = texture(TEXTURE, scroll_uv);
	COLOR.a = opacity;
}