#pragma once

#include <stdio.h>

extern Hazel::Application* Hazel::CreateApplication();

int main(int argc, char** argv)
{
    Hazel::Log::Init();
    HZ_CORE_WARN("Initialized logger");
    int a = 5;
    HZ_INFO("Running Hazel Application : var={0}", a);

    Hazel::Application* app = Hazel::CreateApplication();
    app->Run();
    delete app;
}
