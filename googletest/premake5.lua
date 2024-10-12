project "GoogleTest"
   kind "StaticLib"
   language "C++"
   cppdialect "C++20"
   staticruntime "off"
   targetdir ("%{_WORKING_DIR}/Binaries/" .. OutputDir .. "/%{prj.name}")
   objdir ("%{_WORKING_DIR}/Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

   flags {
    "MultiProcessorCompile"
   }

   files { 
    "src/**.h",
    "src/**.cc",
    "include/**.h"
   }

   includedirs {
    ".",
    "include/"
   }

   filter "system:windows"
       systemversion "latest"
       defines { }

   filter "configurations:Debug"
       defines { "DEBUG" }
       runtime "Debug"
       symbols "On"

   filter "configurations:Release"
       defines { "NDEBUG" }
       runtime "Release"
       optimize "On"
       symbols "On"
