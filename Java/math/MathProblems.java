package math;

public class MathProblems {

    public long factuality(int n){
        long sum = 1;
        for (int i = 1; i < n; i++) {
            sum *= i;
        }
        return sum;
    }

    public int fibonacci(int n){
        if (n <= 1) return 1;
        else{
            return fibonacci(n - 1) + fibonacci(n - 2);
        }
    }

}
