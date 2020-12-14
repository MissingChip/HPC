
#include <mutex>
#include <thread>
#include <condition_variable>

class RecursiveMutex {
private:
    std::thread::id blocking_thread;
    uint amt = 0; // I am unsure if this needs to be volatile
    std::mutex locking_mutex;
    std::mutex mutex;
    std::condition_variable condition_var;
public:
    int lock();
    int try_lock();
    int unlock();
};

inline int RecursiveMutex::lock(){
    std::unique_lock<std::mutex> busy(locking_mutex);
    while(amt > 0 && blocking_thread != std::this_thread::get_id()){
        std::unique_lock<std::mutex> lock(mutex);
        busy.unlock();
        condition_var.wait(lock);
        busy.lock();
    }
    blocking_thread = std::this_thread::get_id();
    amt++;
    return amt;
}

inline int RecursiveMutex::try_lock(){
    std::unique_lock<std::mutex> busy(locking_mutex);
    if(amt==0){
        blocking_thread = std::this_thread::get_id();
        amt=1;
    }
    if(amt > 0){
        if(blocking_thread != std::this_thread::get_id()){
            return 0;
        }
        amt++;
    }
    return amt;
}

inline int RecursiveMutex::unlock(){
    //TODO mutex?
    std::unique_lock<std::mutex> busy(locking_mutex);
    if(blocking_thread != std::this_thread::get_id()){
        //TODO That's an issue
    }
    if(amt <= 0){
        //TODO Also an issue
    }
    amt--;
    if(amt == 0){
        condition_var.notify_one();
    }
    return amt;
}