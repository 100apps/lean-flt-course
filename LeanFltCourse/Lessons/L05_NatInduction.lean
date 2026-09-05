import Mathlib

set_option autoImplicit false

namespace LeanFltCourse.L05

theorem zero_add_by_induction (n : Nat) : 0 + n = n := by
  induction n with
  | zero => rfl
  | succ n _ih => simp

def triangular : Nat → Nat
  | 0 => 0
  | n + 1 => triangular n + (n + 1)

example : triangular 4 = 10 := by
  norm_num [triangular]

theorem triangular_succ (n : Nat) :
    triangular (n + 1) = triangular n + (n + 1) := by
  rfl

end LeanFltCourse.L05
