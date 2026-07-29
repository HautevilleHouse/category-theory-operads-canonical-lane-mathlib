import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadObject where
  carrier : Type u
  operations : List (Type u)
  compositionLaw : Prop
  identityElement : Prop

structure OperadAdmittedObject where
  operad : OperadObject
  categoryStructure : Prop
  operadicEquivalence : Prop

structure AdmissibleClass where
  object : OperadAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.operadicEquivalence ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse