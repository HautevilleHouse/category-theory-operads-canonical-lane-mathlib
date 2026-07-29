import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

def gateClosed (A : OperadAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : OperadAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
