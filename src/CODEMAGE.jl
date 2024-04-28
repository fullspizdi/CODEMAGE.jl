module CODEMAGE

# Import necessary Julia standard libraries
using Base: @eval

# Include submodules for each feature set
include("refactoring.jl")
include("debugging.jl")
include("metaprogramming.jl")
include("performance.jl")

export refactor_function!,
       debug_inspect,
       create_macro,
       optimize_performance

# Main module code and function definitions

"""
    refactor_function!(func, changes::Pair)
Refactor a function name or its parameters based on the provided changes.
"""
refactor_function!(func, changes::Pair) = refactoring.refactor_function!(func, changes)

"""
    debug_inspect(variable)
Inspect a variable to aid in debugging processes.
"""
debug_inspect(variable) = debugging.debug_inspect(variable)

"""
    create_macro(name, definition)
Create a new macro to automate repetitive tasks.
"""
create_macro(name, definition) = metaprogramming.create_macro(name, definition)

"""
    optimize_performance(code_block)
Apply performance optimizations to a given block of code.
"""
optimize_performance(code_block) = performance.optimize_performance(code_block)

end # module

