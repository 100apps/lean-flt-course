import Mathlib

set_option autoImplicit false

namespace LeanFltCourse.L02

/- A proposition is a type; a proof is a value of that type. -/
#check Prop
#check (2 + 2 = 4 : Prop)

theorem keepLeft (P Q : Prop) (hP : P) : Q → P := by
  intro _hQ
  exact hP

theorem keepLeftTerm (P Q : Prop) (hP : P) : Q → P :=
  fun _hQ => hP

theorem applyAProof (P Q : Prop) (hPQ : P → Q) (hP : P) : Q := by
  exact hPQ hP

end LeanFltCourse.L02

