outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

workspace "NeuralNetwork"
    platforms { "x86", "x64" }
    startproject "NeuralNetwork"
    configurations { "Debug", "Release" ,"Dist"}

    systemversion "latest"

    flags
	{
		"MultiProcessorCompile"
	}

    vpaths {
		["Headers"] = { "%{prj.name}/src/**.hpp","%{prj.name}/src/**.h" },
		["Sources"] = { "%{prj.name}/src/**.cpp","%{prj.name}/src/**.c" },
		["images"] = {"**.png","**.jpg","**.bmp","**.ppm","**.pgm","**.pbm","**.tga","**.gif","**.ico","**.icns","**.cur","**.xbm","**.xpm"},
		["shaders"] = {"**.shader","**.frag","**.vert","**.glsl","**.hlsl"},
		["Docs"] = "**.md",
	}

    filter "platforms:x86"
		architecture "x86"
		defines { "x86" }
		
	filter "platforms:x64"
		architecture "x86_64"
		defines { "x64" }

include "NeuralNetwork" 