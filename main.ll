; ModuleID = 'main'
source_filename = "main"

declare double @print_d(double)

define double @fib(double %n) {
entry:
  %tmpcmp = fcmp ult double %n, 2.000000e+00
  br i1 %tmpcmp, label %ifcont, label %else

else:                                             ; preds = %entry
  %tmpsub = fadd double %n, -1.000000e+00
  %tmp = call double @fib(double %tmpsub)
  %tmpsub6 = fadd double %n, -2.000000e+00
  %tmp7 = call double @fib(double %tmpsub6)
  %tmpadd = fadd double %tmp, %tmp7
  br label %ifcont

ifcont:                                           ; preds = %entry, %else
  %iftmp = phi double [ %tmpadd, %else ], [ %n, %entry ]
  ret double %iftmp
}

define double @main() {
entry:
  %tmp = call double @fib(double 4.300000e+01)
  %tmp2 = call double @print_d(double %tmp)
  ret double %tmp2
}
