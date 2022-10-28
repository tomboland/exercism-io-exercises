#include <vector>
#include <stdexcept>

namespace binary_search {

    std::vector<int>::iterator find_pivot(std::vector<int>::iterator it_begin, std::vector<int>::iterator it_end) {
        if (it_begin == it_end) { throw std::domain_error("Item not found"); }
        if (std::distance(it_begin, it_end) <= 1) { return it_begin; } 
        return it_begin + (std::distance(it_begin, it_end) / 2);
    }

    std::vector<int>::iterator find_rec_helper(std::vector<int>::iterator it_begin, std::vector<int>::iterator it_end, int item) {
        auto pivot = binary_search::find_pivot(it_begin, it_end);
        if (*pivot == item) { return pivot; }
        if (pivot == it_begin) { throw std::domain_error("item not found"); }
        else if (*pivot > item) { return binary_search::find_rec_helper(it_begin, pivot, item); }
        else { return binary_search::find_rec_helper(pivot, it_end, item); }
    }

    std::size_t find(std::vector<int> v, int item) {
        auto position = binary_search::find_rec_helper(std::begin(v), std::end(v), item);
        return std::distance(std::begin(v), position);
    }
}