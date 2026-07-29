import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadGateLemmas

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

def ConstrainedOperadClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_operad_endgame (A : AdmissibleClass) : ConstrainedOperadClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse