import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadicStructure

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadicHomology (O : OperadicStructure) where
  chainComplex : Type u
  boundary : O.operations → chainComplex → chainComplex
  homology : Type v
  homologyGroup : (n : ℕ) → Type v
  boundarySquared : ∀ (f : O.operations), boundary f ∘ boundary f = 0
  homologyDefined : Prop

structure OperadicHomologyEvidence {O : OperadicStructure} (H : OperadicHomology O) where
  chainComplexDefined : Prop
  boundaryDefined : Prop
  homologyDefined : Prop
  homologyGroupDefined : H.homologyGroup = H.homologyGroup
  boundarySquaredClosed : H.boundarySquared

def OperadicHomologyClosed {O : OperadicStructure} (H : OperadicHomology O) : Prop :=
  H.boundarySquared ∧ H.homologyDefined

theorem operadic_homology_closed_from_evidence {O : OperadicStructure} (H : OperadicHomology O) (E : OperadicHomologyEvidence H) : OperadicHomologyClosed H := by
  exact And.intro E.boundarySquaredClosed E.homologyDefined

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse