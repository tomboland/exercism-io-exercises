#include <exception>
#include <map>

namespace dna {
    class counter {
        private:
        std::map<char, int> nucleo_counts;
        inline static const std::string valid_nucleotides = "ATCG";

        static auto validate_nucleotide(char c) {
            if (valid_nucleotides.find(c) == std::string::npos) {
                throw std::invalid_argument("Invalid character in input");
            }
        }

        public:
        counter(std::string nucleostring) : nucleo_counts {
            {'A', 0}, {'T', 0}, {'C', 0}, {'G', 0}
        } {
            for (auto c : nucleostring) {
                validate_nucleotide(c);
                nucleo_counts[c]++;
            }
        }

        auto nucleotide_counts() const {
            return nucleo_counts;
        }

        auto count(char c) const {
            validate_nucleotide(c);
            return nucleo_counts.at(c);
        }
    };
}