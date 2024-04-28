# src/debugging.jl

"""
    debug_inspect(variable)
Inspect a variable to aid in debugging processes. Provides detailed information about the variable's type, value, and other properties.
"""
function debug_inspect(variable)
    println("Inspecting variable...")
    println("Type: ", typeof(variable))
    println("Value: ", variable)
    if typeof(variable) <: Number
        println("Numeric properties:")
        println("  - Is integer: ", isinteger(variable))
        println("  - Is finite: ", isfinite(variable))
    elseif typeof(variable) <: AbstractArray
        println("Array properties:")
        println("  - Dimensions: ", size(variable))
        println("  - Element type: ", eltype(variable))
    end
    println("Detailed inspection completed.")
end

end # module
