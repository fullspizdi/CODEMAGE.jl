# src/metaprogramming.jl

"""
Metaprogramming utilities for CODEMAGE.jl
This module provides tools to extend and manipulate the Julia language itself,
allowing users to create custom functions and macros that can automate and simplify their coding tasks.
"""

module metaprogramming

export create_macro

"""
    create_macro(name::Symbol, definition::Expr)
Create a new macro that automates repetitive tasks or simplifies complex code patterns.
`name` is the symbol representing the macro name.
`definition` is an expression that defines what the macro does.
"""
function create_macro(name::Symbol, definition::Expr)
    eval(Expr(:macro, name, definition))
end

end # module metaprogramming
