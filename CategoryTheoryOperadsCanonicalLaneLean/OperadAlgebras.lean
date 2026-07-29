import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadBases

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure AlgebraPackage (O : OperadPackage) where
  Carrier : Type u
  action : {a b : O.Col} → O.Op a b → (Carrier → Carrier)
  identityAction : (a : O.Col) → action (O.identity a) = id
  compositionAction : {a b c : O.Col} (f : O.Op b c) (g : O.Op a b) →
    action (O.composition f g) = action f ∘ action g

structure AlgebraEvidence (O : OperadPackage) (A : AlgebraPackage O) where
  identityActionClosed : A.identityAction
  compositionActionClosed : A.compositionAction

def AlgebraClosed (O : OperadPackage) (A : AlgebraPackage O) : Prop :=
  A.identityAction ∧ A.compositionAction

theorem algebra_closed_from_evidence (O : OperadPackage) (A : AlgebraPackage O) (E : AlgebraEvidence O A) :
    AlgebraClosed O A := by
  exact And.intro E.identityActionClosed E.compositionActionClosed

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
