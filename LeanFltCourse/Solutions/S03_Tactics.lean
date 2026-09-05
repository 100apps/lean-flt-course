import LeanFltCourse.Lessons.L03_Tactics

namespace LeanFltCourse.Solutions.S03

theorem add_same_right (a b c : Nat) (h : a = b) : a + c = b + c := by
  rw [h]

theorem smallArithmetic (n : Nat) (h : n ≤ 3) : n * n ≤ 9 := by
  interval_cases n <;> norm_num

end LeanFltCourse.Solutions.S03
