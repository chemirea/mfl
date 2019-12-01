; ModuleID = 'main'
source_filename = "main"

declare double @putchar(double)

define double @add(double %x, double %y) {
entry:
  %tmpadd = fadd double %x, %y
  ret double %tmpadd
}

define double @main() {
entry:
  %tmp = call double @add(double 2.000000e+00, double 1.200000e+02)
  %tmp3 = call double @putchar(double %tmp)
  ret double %tmp3
}
