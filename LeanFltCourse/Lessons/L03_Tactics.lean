import Mathlib

set_option autoImplicit false

namespace LeanFltCourse.L03

example (a b : Nat) (h : a = b) : a + 1 = b + 1 := by
  rw [h]

example (a b c : Nat) (hab : a = b) (hbc : b = c) : a = c := by
  exact hab.trans hbc

example (x : Int) : x + x = 2 * x := by
  ring

example (a b : Nat) (h₁ : a ≤ b) (h₂ : b ≤ a) : a = b := by
  omega

end LeanFltCourse.L03

