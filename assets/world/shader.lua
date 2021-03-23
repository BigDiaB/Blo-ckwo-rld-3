    return [[
        extern vec2 light_positions[30];
        extern float light_size;
        extern vec2 camera;
        extern number number_of_lights;
        extern number time;
        number bright;
        
        vec4 effect(vec4 color, Image texture, vec2 uvs, vec2 coords){
            vec4 pixel = Texel(texture, uvs);
            vec3 rgb = vec3(0.3,0.3,0.3);
        
            for (int i = 0; i < number_of_lights; i++){
                number dist = distance(coords, light_positions[i] - camera) / number_of_lights;
                if (time == 1) bright = 4;
                else bright = 3 / dist * light_size;
                rgb.x *= bright;
                rgb.y *= bright;
                rgb.z *= bright;
            }
            rgb = clamp(rgb, 0, 1);
            pixel.r = pixel.r * rgb.x;
            pixel.g = pixel.g * rgb.y;
            pixel.b = pixel.b * rgb.z;
            return pixel * color;
        }
    ]]