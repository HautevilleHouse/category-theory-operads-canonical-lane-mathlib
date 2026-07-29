import CategoryTheoryOperadsCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure AdmissibleClass where
  object : OperadAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  OperadWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
