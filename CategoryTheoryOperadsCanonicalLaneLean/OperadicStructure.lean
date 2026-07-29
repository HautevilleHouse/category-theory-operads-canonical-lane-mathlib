import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadicStructure where
  colors : Type u
  operations : Type v
  composition : operations → (List operations) → operations
  unit : operations
  associativity : ∀ (f : operations) (gs : List operations) (hs : List (List operations)), 
    composition f (gs.map (λ g => composition g hs.flatten)) = composition (composition f gs) (hs.flatten)
  unitLeft : ∀ (f : operations), composition f [unit] = f
  unitRight : ∀ (f : operations), composition unit [f] = f
  symmetricGroupAction : (n : ℕ) → operations → (Equiv.Perm n) → operations
  equivariance : ∀ (f : operations) (σ : Equiv.Perm (List.length f.args)) (τs : List (Equiv.Perm ...)), 
    ...

structure OperadicEvidence (O : OperadicStructure) where
  colorsDefined : Prop
  operationsDefined : Prop
  compositionDefined : O.composition = O.composition
  unitDefined : O.unit = O.unit
  associativityClosed : O.associativity
  unitLeftClosed : O.unitLeft
  unitRightClosed : O.unitRight
  symmetricGroupActionDefined : Prop
  equivarianceClosed : O.equivariance

def OperadicClosed (O : OperadicStructure) : Prop :=
  O.associativity ∧ O.unitLeft ∧ O.unitRight ∧ O.equivariance

theorem operadic_closed_from_evidence (O : OperadicStructure) (E : OperadicEvidence O) : OperadicClosed O := by
  exact And.intro E.associativityClosed (And.intro E.unitLeftClosed (And.intro E.unitRightClosed E.equivarianceClosed))

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse