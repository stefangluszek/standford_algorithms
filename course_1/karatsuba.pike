int digits(int n)
{
    if (n == 0)
        return 1;

    int d;
    while (n > 0)
    {
        d++;
        n /= 10;
    }
    return d;
}
int karatsuba(int x, int y)
{
    if (x < 10 && y < 10)
        return x * y;

    int n = max(digits(x), digits(y));
    int m = n / 2;
    int a = x / pow(10, m);
    int b = x % pow(10, m);
    int c = y / pow(10, m);
    int d = y % pow(10, m);

    int ac = karatsuba(a, c);
    int bd = karatsuba(b, d);
    int gauss_trick = karatsuba(a + b, c + d) - ac - bd;

    return pow(10, m * 2) * ac + pow(10, m) * gauss_trick + bd;
}

int main()
{
    int a = 3141592653589793238462643383279502884197169399375105820974944592;
    int b = 2718281828459045235360287471352662497757247093699959574966967627;

    int k = a * b;
    int l = karatsuba(a, b);

    werror("%d\n", l);
}
