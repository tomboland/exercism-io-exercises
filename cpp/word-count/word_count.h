#include <iostream>
#include <iterator>
#include <sstream>
#include <map>
#include <algorithm>
#include <functional>

using namespace std;
using namespace std::placeholders;

string filter_chars(const char *exclusions, string s) {
    const auto first_word_char {s.find_first_not_of(exclusions)};
    if (first_word_char == string::npos) { return ""; }
    const auto last_word_char {s.find_last_not_of(exclusions)};
    return s.substr(first_word_char, last_word_char - first_word_char + 1);
}

auto filter_punctuation = std::bind(&filter_chars, ",.'\";:!&@$%^", _1);

namespace word_count {
    const map<string, int> words(string sentence) {
        map<string, int> wfreq;
        string word_space;
        string word_comma;
        stringstream iss_comma;
        istringstream iss_space(sentence);
        while (iss_space >> word_space) {
            iss_comma << word_space;
            while (getline(iss_comma, word_comma, ',')) {
                string filtered = filter_punctuation(word_comma);
                string lowercased;
                transform(begin(filtered), end(filtered), back_inserter(lowercased), ::tolower);
                if (lowercased != "") {
                    ++wfreq[lowercased];
                }
            }
            iss_comma.clear();
        }
        return wfreq;
    }
}