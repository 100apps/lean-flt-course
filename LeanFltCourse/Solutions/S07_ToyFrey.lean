import LeanFltCourse.Lessons.L07_ToyFrey

namespace LeanFltCourse.Solutions.S07

open LeanFltCourse.L06 LeanFltCourse.L07

theorem coreContradiction
    (P : ToyFrey)
    (hIrr : IsIrreducible P)
    (hNotIrr : ¬ IsIrreducible P) : False := by
  exact hNotIrr hIrr

end LeanFltCourse.Solutions.S07

