import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryOperads.BridgeLemmas
import CategoryTheoryOperads.GateLemmas

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

def ConstrainedOperadClosure (A : OperadAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_operad_endgame (A : OperadAdmissibleClass) :
    ConstrainedOperadClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
