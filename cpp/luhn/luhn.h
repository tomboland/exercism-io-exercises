#include <string>
#include <regex>
#include <boost/range/adaptor/filtered.hpp>
#include <boost/range/adaptor/transformed.hpp>
#include <boost/range/adaptor/reversed.hpp>
#include <boost/range/algorithm/copy.hpp>
#include <boost/range/numeric.hpp>
#include <boost/lexical_cast.hpp>

using namespace boost::adaptors;

std::regex numeric_with_spaces_pattern("^[\\d ]*$");

namespace luhn {
    bool valid(std::string luhn_chars) {
        if (!std::regex_match(luhn_chars, numeric_with_spaces_pattern)) { return false; }
        auto luhn_normalised = luhn_chars | filtered([](char c) { return c != ' '; });
        if (boost::size(luhn_normalised) < 2) { return false; }
        bool toggle_index = true;
        auto sum = boost::accumulate(
            luhn_normalised
            | transformed(boost::lexical_cast<int, char>)
            | reversed
            | transformed([&toggle_index](int x) { if ((toggle_index = !toggle_index)) { 
                    int y = x * 2; return y > 9 ? y - 9 : y;
                } else { return x; } }),
            0);
        return sum % 10 == 0 ? true : false;
    }
}