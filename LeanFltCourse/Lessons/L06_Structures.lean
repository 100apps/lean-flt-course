import Mathlib

set_option autoImplicit false

namespace LeanFltCourse.L06

structure ToyFrey where
  a : Int
  b : Int
  c : Int
  p : Nat
  hp5 : 5 ≤ p
  hEquation : a ^ p + b ^ p = c ^ p

def trivialPackage : ToyFrey where
  a := 0
  b := 0
  c := 0
  p := 5
  hp5 := by norm_num
  hEquation := by norm_num

def exponent (P : ToyFrey) : Nat := P.p

theorem exponent_ge_five (P : ToyFrey) : 5 ≤ exponent P := by
  exact P.hp5

#check ToyFrey.a
#check ToyFrey.hp5

end LeanFltCourse.L06

