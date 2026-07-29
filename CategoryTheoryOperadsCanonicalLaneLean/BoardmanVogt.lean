import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure BoardmanVogtConstructionPackage where
  operad : OperadCategoryPackage
  wConstruction : Prop
  cofibrancy : Prop
  homotopyInvariance : Prop
  resolutionProperty : Prop

structure BoardmanVogtEvidence (B : BoardmanVogtConstructionPackage) where
  wConstructionClosed : B.wConstruction
  cofibrancyClosed : B.cofibrancy
  homotopyInvarianceClosed : B.homotopyInvariance
  resolutionPropertyClosed : B.resolutionProperty

def BoardmanVogtClosed (B : BoardmanVogtConstructionPackage) : Prop :=
  B.wConstruction ∧ B.cofibrancy ∧ B.homotopyInvariance ∧ B.resolutionProperty

theorem boardman_vogt_closed_from_evidence (B : BoardmanVogtConstructionPackage)
    (E : BoardmanVogtEvidence B) : BoardmanVogtClosed B := by
  exact And.intro E.wConstructionClosed
    (And.intro E.cofibrancyClosed
      (And.intro E.homotopyInvarianceClosed E.resolutionPropertyClosed))

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse