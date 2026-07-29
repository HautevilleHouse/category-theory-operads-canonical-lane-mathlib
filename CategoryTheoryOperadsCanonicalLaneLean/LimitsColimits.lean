import CategoryTheoryOperadsCanonicalLaneLean.YonedaEmbedding
import Mathlib.CategoryTheory.Limits.Shapes.Terminal
import Mathlib.CategoryTheory.Limits.Shapes.Products
import Mathlib.CategoryTheory.Limits.Shapes.Equalizers

/-!
# Limits and Colimits Package
-/

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

open CategoryTheory

structure LimitsColimitsPackage {P : OperadStructurePackage} where
  terminalObject : Limits.Terminal P.baseCategory
  binaryProducts : Limits.HasBinaryProducts P.baseCategory
  equalizers : Limits.HasEqualizers P.baseCategory
  initialObject : Limits.Initial P.baseCategory
  binaryCoproducts : Limits.HasBinaryCoproducts P.baseCategory
  coequalizers : Limits.HasCoequalizers P.baseCategory

structure LimitsColimitsEvidence {P : OperadStructurePackage} (L : LimitsColimitsPackage P) where
  terminalObjectClosed : L.terminalObject.terminal
  binaryProductsClosed : L.binaryProducts
  equalizersClosed : L.equalizers
  initialObjectClosed : L.initialObject.initial
  binaryCoproductsClosed : L.binaryCoproducts
  coequalizersClosed : L.coequalizers

def LimitsColimitsClosed {P : OperadStructurePackage} (L : LimitsColimitsPackage P) : Prop :=
  L.terminalObject.terminal ∧ L.binaryProducts ∧ L.equalizers ∧
  L.initialObject.initial ∧ L.binaryCoproducts ∧ L.coequalizers

theorem limits_colimits_closed_from_evidence {P : OperadStructurePackage} (L : LimitsColimitsPackage P) (E : LimitsColimitsEvidence L) :
    LimitsColimitsClosed L := by
  exact And.intro E.terminalObjectClosed
    (And.intro E.binaryProductsClosed
      (And.intro E.equalizersClosed
        (And.intro E.initialObjectClosed
          (And.intro E.binaryCoproductsClosed E.coequalizersClosed))))

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
