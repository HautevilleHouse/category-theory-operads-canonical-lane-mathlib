import CategoryTheoryOperadsCanonicalLaneLean.OperadStructure
import Mathlib.CategoryTheory.Yoneda

/-!
# Yoneda Embedding Package
-/

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

open CategoryTheory

structure YonedaEmbeddingPackage {P : OperadStructurePackage} where
  yonedaFunctor : P.baseCategory ⥤ (P.baseCategoryᵒᵖ ⥤ Type u)
  isFullyFaithful : Prop
  preservesLimits : Prop
  preservesColimits : Prop

structure YonedaEmbeddingEvidence {P : OperadStructurePackage} (Y : YonedaEmbeddingPackage P) where
  isFullyFaithfulClosed : Y.isFullyFaithful
  preservesLimitsClosed : Y.preservesLimits
  preservesColimitsClosed : Y.preservesColimits

def YonedaEmbeddingClosed {P : OperadStructurePackage} (Y : YonedaEmbeddingPackage P) : Prop :=
  Y.isFullyFaithful ∧ Y.preservesLimits ∧ Y.preservesColimits

theorem yoneda_embedding_closed_from_evidence {P : OperadStructurePackage} (Y : YonedaEmbeddingPackage P) (E : YonedaEmbeddingEvidence Y) :
    YonedaEmbeddingClosed Y := by
  exact And.intro E.isFullyFaithfulClosed (And.intro E.preservesLimitsClosed E.preservesColimitsClosed)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
