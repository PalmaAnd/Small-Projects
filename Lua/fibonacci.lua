-- This file is a example, for Fibonacci.
-- It will recursively call the function fibonacci as long as it wasn't executed more times, then defined in MaxIterations

CurrentValue = 0
Count = 0
MaxIterations = 50

-- Simulates the fibonacci sequence recursively, which means this function will call itself {MaxIterations} times.
local function fibonacci(value1, value2)
    CurrentValue = value1
    print(CurrentValue)
    if Count < MaxIterations then
        Count = Count + 1
        fibonacci(value2, value1+value2)
    end
end

fibonacci(0,1)