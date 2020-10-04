// Copyright 2018-2019 Rene Rivera
// Copyright 2017 Two Blue Cubes Ltd. All rights reserved.
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE.txt or copy at http://www.boost.org/LICENSE_1_0.txt)

#ifndef LYRA_DETAIL_INVOKE_LAMBDA_HPP
#define LYRA_DETAIL_INVOKE_LAMBDA_HPP

#include "lyra/parser_result.hpp"
#include "lyra/detail/unary_lambda_traits.hpp"
#include "lyra/detail/result.hpp"
#include "lyra/detail/parse.hpp"

namespace lyra
{
namespace detail
{
    template <typename ReturnType>
    struct LambdaInvoker
    {
        // static_assert(std::is_same<ReturnType, parser_result>::value, "Lambda must return void or lyra::parser_result");

        template <typename L, typename ArgType>
        static parser_result invoke(L const& lambda, ArgType const& arg)
        {
            return lambda(arg);
        }
    };

    template <>
    struct LambdaInvoker<void>
    {
        template <typename L, typename ArgType>
        static parser_result invoke(L const& lambda, ArgType const& arg)
        {
            lambda(arg);
            return parser_result::ok(parser_result_type::matched);
        }
    };

    template <typename ArgType, typename L>
    inline parser_result
    invokeLambda(L const& lambda, std::string const& arg)
    {
        ArgType temp{};
        auto result = parse_string(arg, temp);
        return !result
            ? result
            : LambdaInvoker<typename unary_lambda_traits<L>::ReturnType>::invoke(
                  lambda, temp);
    }
}
} // namespace lyra

#endif
