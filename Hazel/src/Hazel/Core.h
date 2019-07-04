#pragma once

namespace Hazel
{
    #ifdef HZ_PLATFORM_WINDOWS
        #ifdef HZ_BUILD_DLL
            #define HAZEL_API __declspec(dllexport)
        #else
            #define HAZEL_API __declspec(dllimport)
        #endif
    #else
        #ifdef HZ_BUILD_DLL
            #define HAZEL_API __attribute__((visibility("default")))
        #else
            #define HAZEL_API 
        #endif
    #endif

}
