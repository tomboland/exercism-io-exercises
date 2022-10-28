#include <map>
#include <vector>
#include <iostream>

using namespace std;

namespace etl {
    map<char, int> transform(map<int, vector<char>> old) {
        map<char, int> newm;
        for (auto [score, chars] : old) {
            for (char c : chars) {
                newm.emplace(tolower(c), score);
            }
        }
        return newm;
    }
}