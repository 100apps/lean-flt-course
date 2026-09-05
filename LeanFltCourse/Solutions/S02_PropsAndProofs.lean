import LeanFltCourse.Lessons.L02_PropsAndProofs

namespace LeanFltCourse.Solutions.S02

theorem identityProof (P : Prop) (hP : P) : P := by
  exact hP

theorem composeProofs (P Q R : Prop) (hPQ : P → Q) (hQR : Q → R) (hP : P) : R := by
  exact hQR (hPQ hP)

end LeanFltCourse.Solutions.S02

