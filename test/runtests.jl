using Test
using CODEMAGE

# Test suite for the CODEMAGE.jl package

# Test the refactoring functionality
@testset "Refactoring Tests" begin
    # Define a dummy function to refactor
    function old_function_name(x)
        return x * 2
    end

    # Perform the refactoring
    CODEMAGE.refactor_function!(old_function_name, :old_function_name => :new_function_name)

    # Check if the new function name exists and the old one does not
    @test isdefined(Main, :new_function_name)
    @test !isdefined(Main, :old_function_name)
end

# Test the debugging functionality
@testset "Debugging Tests" begin
    test_variable = 42
    @testset "Inspect Variable" begin
        # Capture the output of debug_inspect to a string
        output = IOBuffer()
        redirect_stdout(output) do
            CODEMAGE.debug_inspect(test_variable)
        end
        str_output = String(take!(output))

        # Check if the output contains expected debug information
        @test occursin("Type: Int", str_output)
        @test occursin("Value: 42", str_output)
    end
end

# Test the metaprogramming functionality
@testset "Metaprogramming Tests" begin
    # Create a new macro
    CODEMAGE.create_macro(:test_macro, :(x -> x + 1))

    # Test the macro
    @test @test_macro(1) == 2
end

# Test the performance optimization functionality
@testset "Performance Tests" begin
    test_function = () -> sum([i for i in 1:10000])
    optimized_result = CODEMAGE.optimize_performance(test_function)

    # Check if the function still computes correctly
    @test optimized_result == sum([i for i in 1:10000])
end

println("All tests passed successfully!")
