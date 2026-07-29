import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadCategories

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadLawPackage {P : OperadCategoryPackage} (O : OperadObject) where
  sourceArity : O.operations.length → Prop
  targetArity : O.operations.length → Prop
  compositionAssociative : Prop
  identityCompatibility : Prop

structure OperadLawEvidence {P : OperadCategoryPackage} {O : OperadObject}
    (L : OperadLawPackage O) where
  sourceArityClosed : L.sourceArity O.operations.length
  targetArityClosed : L.targetArity O.operations.length
  compositionAssociativeClosed : L.compositionAssociative
  identityCompatibilityClosed : L.identityCompatibility

def OperadLawClosed {P : OperadCategoryPackage} {O : OperadObject}
    (L : OperadLawPackage O) : Prop :=
  L.sourceArity O.operations.length ∧ L.targetArity O.operations.length ∧
  L.compositionAssociative ∧ L.identityCompatibility

theorem operad_law_closed_from_evidence {P : OperadCategoryPackage} {O : OperadObject}
    (L : OperadLawPackage O) (E : OperadLawEvidence L) : OperadLawClosed L := by
  exact And.intro E.sourceArityClosed
    (And.intro E.targetArityClosed (And.intro E.compositionAssociativeClosed E.identityCompatibilityClosed))

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse