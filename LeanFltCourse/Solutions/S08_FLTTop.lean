import LeanFltCourse.Lessons.L08_FLTTop

namespace LeanFltCourse.Solutions.S08

open LeanFltCourse.L08

theorem useMiniFLT
    (flt : MiniFermatLastTheorem)
    (n a b c : Nat)
    (hn : 3 ≤ n)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    a ^ n + b ^ n ≠ c ^ n := by
  apply flt n hn a b c
  · exact ha.ne'
  · exact hb.ne'
  · exact hc.ne'

end LeanFltCourse.Solutions.S08

