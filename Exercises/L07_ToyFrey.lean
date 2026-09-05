import LeanFltCourse.Lessons.L07_ToyFrey

set_option autoImplicit false

namespace Exercises.L07

open LeanFltCourse.L06 LeanFltCourse.L07

theorem coreContradiction
    (P : ToyFrey)
    (hIrr : IsIrreducible P)
    (hNotIrr : ¬ IsIrreducible P) : False := by
  sorry

end Exercises.L07

