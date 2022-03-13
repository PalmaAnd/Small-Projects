-- This file is a example, for the Fibonacci squence, by solving the problem recursively.

Count = 0
MAX_ITERATIONS = 50

--- Simulates the fibonacci sequence recursively, which means this function will call itself {MAX_ITERATIONS} times.
--- @param value1 integer The current value, which will be displayed in  the console.
--- @param value2 integer The current value and the old value, added together.
--- @return string
local function fibonacci(value1, value2)
    print(value1)
    if Count < MAX_ITERATIONS then
        Count = Count + 1
        fibonacci(value2, value1+value2)
    end
    return 'Ran the Fibonacci Sequence ' .. MAX_ITERATIONS .. ' times'
end

fibonacci(0,1)