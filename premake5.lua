-- premake5.lua
workspace "Hazel"
  architecture "x64"
  configurations
  {
    "Debug",
    "Release",
    "Dist"
  }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Hazel"
  location "Hazel"
  kind "SharedLib"
  language "C++"
  cppdialect "C++17"

  targetdir ("bin/" .. outputdir .. "/%{prj.name}")
  objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

  files
  {
     "%{prj.name}/src/**.h",
     "%{prj.name}/src/**.cpp"
  }

  includedirs
  {
     "%{prj.name}/vendor/spdlog/include"
  }

  filter { "system:linux", "system:macosx" }
     defines
     {
         "HZ_PLATFORM_LINUX",
     }

  filter "system:windows"
     staticruntime "On"
     systemversion "latest"

     defines
     {
         "HZ_PLATFORM_WINDOWS",
         "HZ_BUILD_DLL",
     }

     postbuildcommands
     {
         ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
     }

  filter "configurations:Debug"
     defines "HZ_DEBUG"
     symbols "On"

  filter "configurations:Release"
     defines "HZ_RELEASE"
     optimize "On"

  filter "configurations:Dist"
     defines "HZ_DIST"
     optimize "On"


project "Sandbox"
  location "Sandbox"
  kind "ConsoleApp"
  language "C++"
  cppdialect "C++17"

   targetdir ("bin/" .. outputdir .. "/%{prj.name}")
   objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

   files
   {
      "%{prj.name}/src/**.h",
      "%{prj.name}/src/**.cpp"
   }

   includedirs
   {
      "%{prj.name}/src",
      "Hazel/vendor/spdlog/include",
      "Hazel/src"
   }

   links
   {
       "Hazel"
   }

   filter { "system:linux", "system:macosx" }
      defines
      {
          "HZ_PLATFORM_LINUX",
      }

   filter "system:windows"
      cppdialect "C++17"
      staticruntime "On"
      systemversion "latest"

      defines
      {
          "HZ_PLATFORM_WINDOWS",
      }

   filter "configurations:Debug"
      defines "HZ_DEBUG"
      symbols "On"

   filter "configurations:Release"
      defines "HZ_RELEASE"
      optimize "On"

   filter "configurations:Dist"
      defines "HZ_DIST"
      optimize "On"
