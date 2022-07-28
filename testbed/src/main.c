#include <core/logger.h>
#include <core/asserts.h>

int main(void)
{
    KFATAL("A test fatal message: %f", 3.14f);
    KERROR("A test error message: %f", 3.14f);
    KWARN("A test warn message: %f", 3.14f);
    KINFO("A test info message: %f", 3.14f);
    KDEBUG("A test debug message: %f", 3.14f);
    KTRACE("A test trace message: %f", 3.14f);

    KASSERT(1 == 0);

    return 0;
}