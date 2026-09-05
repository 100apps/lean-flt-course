import LeanFltCourse.Lessons.L08_FLTTop

set_option autoImplicit false

namespace Exercises.L08

open LeanFltCourse.L08

theorem useMiniFLT
    (flt : MiniFermatLastTheorem)
    (n a b c : Nat)
    (hn : 3 ≤ n)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    a ^ n + b ^ n ≠ c ^ n := by
  sorry

end Exercises.L08

