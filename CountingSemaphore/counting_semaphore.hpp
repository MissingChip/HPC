
#include <mutex>
#include <thread>
#include <condition_variable>

class RecursiveMutex {
private:
    uint amt = 0;
    std::mutex locking_mutex;
    std::condition_variable condition_var;
public:
    int lock();
    int try_lock();
    int unlock();
};

inline int RecursiveMutex::lock(){
    std::unique_lock<std::mutex> busy(locking_mutex);
    while(amt <= 0){
        condition_var.wait(busy);
    }
    return amt--;
}

inline int RecursiveMutex::try_lock(){
    std::unique_lock<std::mutex> busy(locking_mutex);
    if(amt <= 0){
        return 0;
    }
    return amt--;
}

inline int RecursiveMutex::unlock(){
    std::unique_lock<std::mutex> busy(locking_mutex);
    if(amt < 0){
        //TODO an issue
    }
    condition_var.notify_one();
    return amt++;
}