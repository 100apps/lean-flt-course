import LeanFltCourse.Lessons.L05_NatInduction

namespace LeanFltCourse.Solutions.S05

theorem one_mul_by_induction (n : Nat) : 1 * n = n := by
  induction n with
  | zero => rfl
  | succ n _ih => simp

end LeanFltCourse.Solutions.S05
