#include <iostream>

#include "library.h"

int print_hello_world()
{
    std::cout << "Library: Hello World" << '\n';
    return 1;
}

unsigned int factorial(unsigned int number)
{
    return number <= 1 ? 1 : factorial(number - 1) * number;
}
