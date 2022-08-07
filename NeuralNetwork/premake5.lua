project "NeuralNetwork"
    kind "ConsoleApp"

    language "C++"
    cppdialect "C++20"
    staticruntime "off"

    links {
    }

    defines {
    }

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

    files {
		"src/**.hpp", 
		"src/**.h", 
		"src/**.cpp", 
		"src/**.c", 
		"res/**.**",
	}

	includedirs {
		"src/",
		"../",
		IncludeDir,
	}

    filter "system:windows"
		postbuildcommands {
			"{COPY} res/ ../bin/" .. outputdir .. "/%{prj.name}/res/", --copy resource files
		}
	filter ("files:Raytracing/vendor/**.**")
		flags {"NoPCH"}

	filter "configurations:Debug"
		defines { "_DEBUG" }
		runtime "Debug"
		buildoptions "/MDd"
		symbols "On"
		
	filter "configurations:Release"
		defines { "_NDEBUG" }
		runtime "Release"
		buildoptions "/MD"
		optimize "On"
		
	filter "configurations:Dist"
		defines { "_NDEBUG","_DIST" }
		runtime "Release"
		buildoptions "/MD"
		optimize "On"