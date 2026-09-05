import Mathlib

set_option autoImplicit false

namespace LeanFltCourse.L01

/- Every Lean expression has a type. -/
#check Nat
#check (3 : Nat)
#check (3 ≤ 5)
#check (fun n : Nat => n + 1)

def double (n : Nat) : Nat := n + n

#eval double 7

example : double 7 = 14 := by
  norm_num [double]

theorem double_zero : double 0 = 0 := by
  rfl

end LeanFltCourse.L01

