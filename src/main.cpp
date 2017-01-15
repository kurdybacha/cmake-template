#include <zmq.h>

int main(int argc, char *argv[])
{
    auto ctx = zmq_ctx_new();
    zmq_ctx_destroy(ctx);
    return 0;
}
