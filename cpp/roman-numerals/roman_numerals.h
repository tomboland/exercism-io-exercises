#include <vector>
#include <string>

std::vector<std::pair<int, std::string>> numerals = {
    {1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"}, {90, "XC"},
    {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}
};

std::string strcat_count(std::string s, int count) {
    std::string concatted;
    for (auto i = 0 ; i < count ; i++) {
        concatted += s;
    }
    return concatted;
}

namespace roman {
    std::string convert(int num) {
        auto reducing_total = num;
        std::string mutant_roman;
        for (auto [arabic, roman] : numerals) {
            auto [quotient, remainder] = std::div(reducing_total, arabic);
            mutant_roman += strcat_count(roman, quotient);
            reducing_total = remainder;
        }
        return mutant_roman;
    }
}