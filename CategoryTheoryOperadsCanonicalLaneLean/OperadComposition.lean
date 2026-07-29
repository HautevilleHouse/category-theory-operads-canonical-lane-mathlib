import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadDefinition

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure CompositionPackage (O : OperadPackage) where
  compositionAxioms : Prop
  compositionConsistency : Prop
  compositionAxiomsClosed : compositionAxioms
  compositionConsistencyClosed : compositionConsistency

structure CompositionEvidence {O : OperadPackage} (C : CompositionPackage O) where
  compositionAxiomsClosed : C.compositionAxioms
  compositionConsistencyClosed : C.compositionConsistency

def CompositionClosed {O : OperadPackage} (C : CompositionPackage O) : Prop :=
  C.compositionAxioms ∧ C.compositionConsistency

theorem composition_closed_from_evidence {O : OperadPackage} (C : CompositionPackage O) (E : CompositionEvidence C) : CompositionClosed C := by
  exact And.intro E.compositionAxiomsClosed E.compositionConsistencyClosed

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse