#if !defined(VertexCommon_lib)
    #define VertexCommon_lib

struct Vertex {

    vec3 positionOS;

    vec3 normalOS;

    #ifdef NEEDTBN
    vec4 tangentOS;
    #endif // NEEDTBN

    // todo  uv define ?
    #ifdef UV
    vec2 texCoord0;
    #endif // UV

    #ifdef UV1
    vec2 texCoord1;
    #endif // UV1

    #ifdef COLOR
    vec4 vertexColor;
    #endif // COLOR
};

/**
 * vertex position
 */
vec4 getVertexPosition()
{
    vec4 position = a_Position;
    return position;
}

/**
 * world matrix
 */
mat4 getWorldMatrix()
{
    #ifdef GPU_INSTANCE
    mat4 worldMat = a_WorldMat;
    #else
    mat4 worldMat = u_WorldMat;
    #endif // GPU_INSTANCE

    #ifdef BONE
    ivec4 boneIndex = ivec4(a_BoneIndices);
    mat4 skinTrans = u_Bones[boneIndex.x] * a_BoneWeights.x;
    skinTrans += u_Bones[boneIndex.y] * a_BoneWeights.y;
    skinTrans += u_Bones[boneIndex.z] * a_BoneWeights.z;
    skinTrans += u_Bones[boneIndex.w] * a_BoneWeights.w;
    worldMat = worldMat * skinTrans;
    #endif // BONE

    return worldMat;
}

vec2 transformUV(in vec2 texcoord, in vec4 tilingOffset)
{
    vec2 uv = texcoord * tilingOffset.xy + tilingOffset.zw * vec2(1.0, -1.0) + vec2(0.0, 1.0 - tilingOffset.y);
    return uv;
}

vec2 tranformLightMapUV(in vec2 texcoord, in vec4 tilingOffset)
{
    vec2 lightMapUV = vec2(texcoord.x, 1.0 - texcoord.y) * tilingOffset.xy + tilingOffset.zw;
    lightMapUV.y = 1.0 - lightMapUV.y;
    return lightMapUV;
}

void getVertexParams(inout Vertex vertex)
{
    vertex.positionOS = getVertexPosition().xyz;

    vertex.normalOS = a_Normal;

    #ifdef NEEDTBN
    vertex.tangentOS = a_Tangent0;
    #endif // NEEDTBN

    #ifdef UV
    vertex.texCoord0 = a_Texcoord0;
    #endif // UV

    #ifdef UV1
    vertex.texCoord1 = a_Texcoord1;
    #endif // UV1

    #ifdef COLOR
    vertex.vertexColor = a_Color;
    #endif // COLOR
}

#endif // VertexCommon_lib