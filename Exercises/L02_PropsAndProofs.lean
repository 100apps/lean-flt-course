import LeanFltCourse.Lessons.L02_PropsAndProofs

set_option autoImplicit false

namespace Exercises.L02

theorem identityProof (P : Prop) (hP : P) : P := by
  sorry

theorem composeProofs
    (P Q R : Prop) (hPQ : P → Q) (hQR : Q → R) (hP : P) : R := by
  sorry

end Exercises.L02

