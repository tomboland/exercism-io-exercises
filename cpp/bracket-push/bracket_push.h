#include <stack>
#include <string>
#include <optional>

namespace bracket_push {
    enum class bracket_type {square, brace, parentheses};
    enum class operation {open, close};
    typedef std::pair<bracket_type, operation> bracket_operation;

    std::optional<bracket_operation> check_char_action(char c) {
        switch (c) {
            case '{': return bracket_operation{bracket_type::brace, operation::open};
            case '}': return bracket_operation{bracket_type::brace, operation::close};
            case '[': return bracket_operation{bracket_type::square, operation::open};
            case ']': return bracket_operation{bracket_type::square, operation::close};
            case '(': return bracket_operation{bracket_type::parentheses, operation::open};
            case ')': return bracket_operation{bracket_type::parentheses, operation::close};
            default: return {};
        }
    }

    bool check(std::string s) {
        std::stack<bracket_type> bracket_stack;
        for (auto c : s) {
            auto possible_action = bracket_push::check_char_action(c);
            if (possible_action.has_value()) {
                auto [bracket_type, operation] = possible_action.value();
                switch (operation) {
                    case operation::open: bracket_stack.push(bracket_type); break;
                    case operation::close: {
                        if (bracket_stack.empty() || bracket_stack.top() != bracket_type) {
                            return false;
                            break;
                        } else {
                            bracket_stack.pop();
                        }
                    }
                }
            }
        }
        return bracket_stack.empty();
    }
}