import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

def ConstrainedCategoryTheoryOperadsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_category_theory_operads_endgame (A : AdmissibleClass) :
    ConstrainedCategoryTheoryOperadsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse