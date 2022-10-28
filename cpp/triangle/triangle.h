#include <stdexcept>
#include <tuple>

namespace triangle {
    enum class flavor {
        equilateral,
        isosceles,
        scalene
    };

    typedef std::tuple<float, float, float> triangle;

    triangle valid_triangle(float a, float b, float c) {
        if (a + b < c || a + c < b || b + c < a) {
            throw std::domain_error("triangle does not satisfy inequality rule");
        }
        if (a <= 0 || b <= 0 || c <= 0) {
            throw std::domain_error("bad triangle length");
        }
        return std::make_tuple(a, b, c);
    }

    flavor kind(float a, float b, float c) {
        auto [va, vb, vc] = valid_triangle(a, b, c);
        if (va == vb && vb == vc) {
            return flavor::equilateral;
        }
        if ((va == vb && va != vc) || (va == vc && va != vb) || (vb == vc && vb != va)) {
            return flavor::isosceles;
        }
        if (va != vb && va != vc) {
            return flavor::scalene;
        }
        throw std::domain_error("triangle matching failed in some way");
    }
}