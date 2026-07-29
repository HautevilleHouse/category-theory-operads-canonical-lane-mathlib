import CategoryTheoryOperadsCanonicalLaneLean.MathlibObjects
import Mathlib.CategoryTheory.Operad.Basic
import Mathlib.CategoryTheory.Monoidal.Basic

/-!
# Operad Structure Package
-/

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadStructurePackage where
  baseCategory : Type u
  monoidalStructure : MonoidalCategoryStruct baseCategory
  operad : Operad baseCategory
  compositionLaw : Prop
  symmetricGroupAction : Prop
  unitsExist : Prop

structure OperadStructureEvidence (P : OperadStructurePackage) where
  compositionLawClosed : P.compositionLaw
  symmetricGroupActionClosed : P.symmetricGroupAction
  unitsExistClosed : P.unitsExist

def OperadStructureClosed (P : OperadStructurePackage) : Prop :=
  P.compositionLaw ∧ P.symmetricGroupAction ∧ P.unitsExist

theorem operad_structure_closed_from_evidence (P : OperadStructurePackage) (E : OperadStructureEvidence P) :
    OperadStructureClosed P := by
  exact And.intro E.compositionLawClosed (And.intro E.symmetricGroupActionClosed E.unitsExistClosed)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
