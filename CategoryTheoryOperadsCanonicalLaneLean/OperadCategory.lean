import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadPackage where
  colors : Type u
  operations : ℕ → Type v
  composition : (n : ℕ) → (m : ℕ) → operations n → (Fin n → operations m) → operations m
  identities : (c : colors) → operations 1
  associativity : Prop
  unitality : Prop

structure OperadEvidence (O : OperadPackage) where
  associativityClosed : O.associativity
  unitalityClosed : O.unitality

def OperadClosed (O : OperadPackage) : Prop :=
  O.associativity ∧ O.unitality

theorem operad_closed_from_evidence (O : OperadPackage) (E : OperadEvidence O) : OperadClosed O :=
  And.intro E.associativityClosed E.unitalityClosed

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse