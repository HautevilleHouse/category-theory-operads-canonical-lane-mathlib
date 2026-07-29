import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadAdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadCategoryPackage where
  underlyingCategory : Type u
  objects : Type v
  morphisms : Type w
  composition : Prop
  identities : Prop
  associativity : Prop
  unitLaws : Prop

structure OperadCategoryEvidence (P : OperadCategoryPackage) where
  compositionClosed : P.composition
  identitiesClosed : P.identities
  associativityClosed : P.associativity
  unitLawsClosed : P.unitLaws

def OperadCategoryClosed (P : OperadCategoryPackage) : Prop :=
  P.composition ∧ P.identities ∧ P.associativity ∧ P.unitLaws

theorem operad_category_closed_from_evidence (P : OperadCategoryPackage)
    (E : OperadCategoryEvidence P) : OperadCategoryClosed P := by
  exact And.intro E.compositionClosed
    (And.intro E.identitiesClosed (And.intro E.associativityClosed E.unitLawsClosed))

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse