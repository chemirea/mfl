; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"

@.str = private unnamed_addr constant [6 x i8] c"%.0f\0A\00", align 1

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

ifcont:                                           ; preds = %else, %entry
  %iftmp = phi double [ %tmpadd, %else ], [ %n, %entry ]
  ret double %iftmp
}

define double @main() {
entry:
  %tmp = call double @fib(double 4.300000e+01)
  %tmp2 = call double @print_d(double %tmp)
  ret double %tmp2
}

; Function Attrs: nofree nounwind ssp uwtable
define double @print_d(double) #0 {
  %2 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), double %0)
  ret double 0.000000e+00
}

; Function Attrs: nofree nounwind
declare i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #1

attributes #0 = { nofree nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nofree nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2}

!0 = !{!"clang version 9.0.0 (tags/RELEASE_900/final)"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
