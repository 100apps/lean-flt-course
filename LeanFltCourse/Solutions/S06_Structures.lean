import LeanFltCourse.Lessons.L06_Structures

namespace LeanFltCourse.Solutions.S06

open LeanFltCourse.L06

theorem exponent_positive (P : ToyFrey) : 0 < P.p := by
  exact lt_of_lt_of_le (by norm_num) P.hp5

end LeanFltCourse.Solutions.S06
