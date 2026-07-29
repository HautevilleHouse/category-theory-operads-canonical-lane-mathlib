import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadPackage where
  Col : Type u
  Op : Col → Col → Type v
  composition : {a b c : Col} → Op b c → Op a b → Op a c
  identity : (a : Col) → Op a a
  associativity : {a b c d : Col} (f : Op c d) (g : Op b c) (h : Op a b) →
    composition (composition f g) h = composition f (composition g h)
  leftIdentity : {a b : Col} (f : Op a b) → composition (identity b) f = f
  rightIdentity : {a b : Col} (f : Op a b) → composition f (identity a) = f

structure OperadEvidence (O : OperadPackage) where
  associativityClosed : O.associativity
  leftIdentityClosed : O.leftIdentity
  rightIdentityClosed : O.rightIdentity

def OperadClosed (O : OperadPackage) : Prop :=
  O.associativity ∧ O.leftIdentity ∧ O.rightIdentity

theorem operad_closed_from_evidence (O : OperadPackage) (E : OperadEvidence O) : OperadClosed O := by
  exact And.intro E.associativityClosed (And.intro E.leftIdentityClosed E.rightIdentityClosed)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
