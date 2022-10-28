#include <algorithm>
#include <vector>
#include <set>
#include <iostream>

using namespace std;

template <typename F>
string map_string(string s, F(*f)(F)) {
    string out;
    transform(begin(s), end(s), back_inserter(out), f);
    return out;
} 

namespace anagram {
    class anagram {
        private:
        multiset<char> subject;
        string lower_subject;        

        public:
        anagram(string s) {
            lower_subject = map_string(s, ::tolower);
            subject = multiset(begin(lower_subject), end(lower_subject));
        }
        vector<string> matches(vector<string> candidates) {
            vector<string> anagrams;
            for (string s : candidates) {
                string lower = map_string(s, ::tolower);
                if (lower == lower_subject) { continue; }
                multiset<char> possible_candidate = multiset(begin(lower), end(lower));
                if (possible_candidate == subject) {
                    anagrams.push_back(s);
                }
            }
            return anagrams;
        }
    };
}