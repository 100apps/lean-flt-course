import LeanFltCourse.Lessons.L04_Logic

namespace LeanFltCourse.Solutions.S04

theorem orSwap (P Q : Prop) : P ∨ Q → Q ∨ P := by
  intro h
  rcases h with hP | hQ
  · exact Or.inr hP
  · exact Or.inl hQ

theorem falseFromBoth (P : Prop) (h : P ∧ ¬ P) : False := by
  exact h.2 h.1

end LeanFltCourse.Solutions.S04

