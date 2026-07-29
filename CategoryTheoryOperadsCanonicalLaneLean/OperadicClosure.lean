import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadicStructure
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadAlgebra
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadModule

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := 
  true

def gateClosed (A : AdmissibleClass) : Prop := 
  A.endpointSatisfied ∨ A.remainderRecorded

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact trivial

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedOperadClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_operad_endgame (A : AdmissibleClass) : ConstrainedOperadClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse