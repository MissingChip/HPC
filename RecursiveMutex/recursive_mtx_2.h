
#include <mutex>
#include <thread>
#include <condition_variable>

class RecursiveMutex {
private:
    std::mutex mutex;
    thread_local int locks = 0;
};