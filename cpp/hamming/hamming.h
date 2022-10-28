#include <stdexcept>
#include <range/v3/view/zip.hpp>
#include <range/v3/algorithm/count_if.hpp> 

using namespace ranges;

namespace hamming {
    int compute(std::string x, std::string y) {
        if (x.size() != y.size()) { throw std::domain_error("invalid"); };
        return count_if(view::zip(x, y), [](auto xy) { return xy.first != xy.second; });
    }
}