using namespace std;

namespace leap {
    template <typename T>
    bool is_leap_year(T year) {
        if (
            (year % 4 == 0 && year % 100 != 0) || 
            (year % 4 == 0 && year % 100 == 0 && year % 400 == 0)
        ) { 
            return true;
        }
        return false;
    }
}