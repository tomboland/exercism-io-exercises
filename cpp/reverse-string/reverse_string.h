#include <string>
#include <algorithm>

using namespace std;

namespace reverse_string {
    string reverse_string(string s) {
        return string(s.rbegin(), s.rend());
    }
}