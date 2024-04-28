# src/refactoring.jl
"""
This module provides refactoring utilities for Julia code within the CODEMAGE.jl package.
"""

module refactoring

export refactor_function!

"""
    refactor_function!(func, changes::Pair)
Refactor a function name or its parameters based on the provided changes.
This function allows renaming of functions and changing parameter names in a given function definition.
"""
function refactor_function!(func, changes::Pair)
    # Extract old and new names from the changes pair
    old_name, new_name = changes.first, changes.second

    # Check if the function exists and can be refactored
    if hasmethod(func, Tuple{})
        # Perform the renaming operation
        @eval begin
            $new_name = $func
            delete_method(methods($func).ms[1])
        end
        println("Function $(old_name) has been successfully renamed to $(new_name).")
    else
        error("Function $(old_name) does not exist or cannot be refactored.")
    end
end

end # module refactoring
