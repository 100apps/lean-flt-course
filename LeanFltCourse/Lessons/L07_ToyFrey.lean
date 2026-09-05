import LeanFltCourse.Lessons.L06_Structures

set_option autoImplicit false

namespace LeanFltCourse.L07

open LeanFltCourse.L06

def IsIrreducible (P : ToyFrey) : Prop := Odd P.p

/- This is the exact logical shape of the FLT repository's final contradiction. -/
theorem noToyFrey
    (P : ToyFrey)
    (mazur : IsIrreducible P)
    (wiles : ¬ IsIrreducible P) :
    False :=
  wiles mazur

theorem noToyFreyFromGlobalResults
    (mazur : ∀ P : ToyFrey, IsIrreducible P)
    (wiles : ∀ P : ToyFrey, ¬ IsIrreducible P)
    (P : ToyFrey) :
    False :=
  wiles P (mazur P)

end LeanFltCourse.L07

