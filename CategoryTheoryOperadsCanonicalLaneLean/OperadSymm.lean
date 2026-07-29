import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadDefinition

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure SymmetricOperadPackage (O : OperadPackage) where
  symmetricGroupAction : Prop
  equivariance : Prop
  symmetricGroupActionClosed : symmetricGroupAction
  equivarianceClosed : equivariance

structure SymmetricOperadEvidence {O : OperadPackage} (S : SymmetricOperadPackage O) where
  symmetricGroupActionClosed : S.symmetricGroupAction
  equivarianceClosed : S.equivariance

def SymmetricOperadClosed {O : OperadPackage} (S : SymmetricOperadPackage O) : Prop :=
  S.symmetricGroupAction ∧ S.equivariance

theorem symmetric_operad_closed_from_evidence {O : OperadPackage} (S : SymmetricOperadPackage O) (E : SymmetricOperadEvidence S) : SymmetricOperadClosed S := by
  exact And.intro E.symmetricGroupActionClosed E.equivarianceClosed

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse