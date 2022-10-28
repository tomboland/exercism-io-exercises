#include "isogram.h"
#include <iterator>
#include <set>
#include <string>
#include <algorithm>

using namespace std;

namespace isogram {
    bool is_isogram(string s) {
        set<char> unique_characters;
        auto test_isogram_char = [&](char &c) {
            if(!isalpha(c)) { return true; }
            auto [_, success] = unique_characters.emplace(tolower(c));
            return success;
        };
        return all_of(s.begin(), s.end(), test_isogram_char);
    }
}