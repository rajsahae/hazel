#pragma once

#include <stdio.h>

extern Hazel::Application* Hazel::CreateApplication();

int main(int argc, char** argv)
{
    printf("Running Hazel Application\n");
    Hazel::Application* app = Hazel::CreateApplication();
    app->Run();
    delete app;
}
