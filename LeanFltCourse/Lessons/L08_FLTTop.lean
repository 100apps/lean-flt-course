import Mathlib.NumberTheory.FLT.Four

set_option autoImplicit false

namespace LeanFltCourse.L08

def MiniFermatLastTheorem : Prop :=
  ∀ n : Nat, 3 ≤ n →
    ∀ a b c : Nat, a ≠ 0 → b ≠ 0 → c ≠ 0 →
      a ^ n + b ^ n ≠ c ^ n

theorem positiveVersion
    (flt : MiniFermatLastTheorem)
    (n : Nat) (hn : 3 ≤ n)
    (a b c : Nat)
    (ha : 0 < a) (hb : 0 < b) (hc : 0 < c) :
    a ^ n + b ^ n ≠ c ^ n := by
  exact flt n hn a b c ha.ne' hb.ne' hc.ne'

/- Mathlib's real definition has this curried shape. -/
#check FermatLastTheorem
#check FermatLastTheorem.of_odd_primes

end LeanFltCourse.L08
