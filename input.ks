extern print_d(n)

def fib(n)
    if n < 2 then
        n
    else 
        fib(n-1) + fib(n-2)

def main()
    var 
        x = fib(43)
    in
        print_d(x)
