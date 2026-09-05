import Mathlib

set_option autoImplicit false

namespace LeanFltCourse.L04

theorem andSwap (P Q : Prop) : P ∧ Q → Q ∧ P := by
  rintro ⟨hP, hQ⟩
  exact ⟨hQ, hP⟩

theorem contradiction (P : Prop) (hP : P) (hnP : ¬ P) : False := by
  exact hnP hP

theorem contradictionTerm (P : Prop) (hP : P) (hnP : ¬ P) : False :=
  hnP hP

theorem notNotIntro (P : Prop) (hP : P) : ¬¬P := by
  intro hnP
  exact hnP hP

end LeanFltCourse.L04

