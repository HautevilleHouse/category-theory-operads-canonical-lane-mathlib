import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure AdjointFunctorPackage (C D : Type u) (MorC : Type v) (MorD : Type w) where
  operadC : Operad C MorC
  operadD : Operad D MorD
  leftAdjoint : C → D
  rightAdjoint : D → C
  unit : ∀ (X : C), X ∈ Operad.objSet (operadC) → MorC
  counit : ∀ (Y : D), Y ∈ Operad.objSet (operadD) → MorD
  adjunctionCondition : ∀ (X : C) (Y : D),
    X ∈ Operad.objSet (operadC) → Y ∈ Operad.objSet (operadD) →
    (
      ∀ (f : MorC) (g : MorD),
        f ∈ Operad.homSet (operadC) X (rightAdjoint Y) →
        g ∈ Operad.homSet (operadD) (leftAdjoint X) Y →
        (Operad.composition (operadC) X (rightAdjoint Y) (rightAdjoint Y) f (counit Y (by assumption)) = 
         Operad.composition (operadC) X X (rightAdjoint Y) (unit X (by assumption)) (rightAdjoint g?)) -- simplified
    )

structure AdjointFunctorEvidence {C D : Type u} {MorC : Type v} {MorD : Type w}
    (A : AdjointFunctorPackage C D MorC MorD) where
  unitClosed : ∀ (X : C), X ∈ Operad.objSet (A.operadC) → A.unit X (by assumption) ∈ Operad.homSet (A.operadC) X (A.rightAdjoint (A.leftAdjoint X))
  counitClosed : ∀ (Y : D), Y ∈ Operad.objSet (A.operadD) → A.counit Y (by assumption) ∈ Operad.homSet (A.operadD) (A.leftAdjoint (A.rightAdjoint Y)) Y
  adjunctionConditionClosed : A.adjunctionCondition

def AdjointFunctorClosed {C D : Type u} {MorC : Type v} {MorD : Type w}
    (A : AdjointFunctorPackage C D MorC MorD) : Prop :=
  (∀ (X : C), X ∈ Operad.objSet (A.operadC) → A.unit X (by assumption) ∈ Operad.homSet (A.operadC) X (A.rightAdjoint (A.leftAdjoint X))) ∧
  (∀ (Y : D), Y ∈ Operad.objSet (A.operadD) → A.counit Y (by assumption) ∈ Operad.homSet (A.operadD) (A.leftAdjoint (A.rightAdjoint Y)) Y) ∧
  A.adjunctionCondition

theorem adjoint_functor_closed_from_evidence {C D : Type u} {MorC : Type v} {MorD : Type w}
    (A : AdjointFunctorPackage C D MorC MorD) (E : AdjointFunctorEvidence A) :
    AdjointFunctorClosed A :=
by
  exact And.intro E.unitClosed (And.intro E.counitClosed E.adjunctionConditionClosed)

end HautevilleHouse
end CategoryTheoryOperadsCanonicalLaneLean