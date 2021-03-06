
attribute vec3 Vertex;
attribute vec3 Normal;
attribute vec2 TexCoord0;
attribute vec4 Tangent;
attribute vec4 Color;
uniform mat4 uModelViewMatrix;
uniform mat4 uProjectionMatrix;
uniform mat3 uModelViewNormalMatrix;

varying vec3 vViewVertex;
varying vec3 vViewNormal;
varying vec4 vViewTangent;
varying vec2 vTexCoord0;
varying vec4 vVertexColor;

void main(void) {

    vViewVertex = vec3(uModelViewMatrix * vec4(Vertex, 1.0));
    vViewNormal = uModelViewNormalMatrix * Normal;
    vViewTangent = vec4(uModelViewNormalMatrix * Tangent.xyz, Tangent.w);
    vTexCoord0 = TexCoord0;
    vVertexColor = Color;
    gl_Position = uProjectionMatrix * uModelViewMatrix * vec4(Vertex,1.0);
}
