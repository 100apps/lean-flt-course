import LeanFltCourse.Lessons.L04_Logic

set_option autoImplicit false

namespace Exercises.L04

theorem orSwap (P Q : Prop) : P ∨ Q → Q ∨ P := by
  sorry

theorem falseFromBoth (P : Prop) (h : P ∧ ¬ P) : False := by
  sorry

end Exercises.L04

