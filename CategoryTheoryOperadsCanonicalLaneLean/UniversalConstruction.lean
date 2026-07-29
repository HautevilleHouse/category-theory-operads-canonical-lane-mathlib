import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure UniversalConstructionPackage (Obj : Type u) (Mor : Type v) where
  operad : Operad Obj Mor
  initialObject : Obj
  initialMorphism : ∀ (X : Obj), X ∈ Operad.objSet (operad) → Mor
  terminalObject : Obj
  terminalMorphism : ∀ (X : Obj), X ∈ Operad.objSet (operad) → Mor
  universalProperty : ∀ (X Y : Obj) (f : Mor),
    X ∈ Operad.objSet (operad) → Y ∈ Operad.objSet (operad) →
    f ∈ Operad.homSet (operad) X Y →
    (Operad.composition (operad) initialObject X Y (initialMorphism X (by assumption)) f = initialMorphism Y (by assumption)) ∧
    (Operad.composition (operad) X Y terminalObject f (terminalMorphism Y (by assumption)) = terminalMorphism X (by assumption))

structure UniversalConstructionEvidence {Obj : Type u} {Mor : Type v}
    (U : UniversalConstructionPackage Obj Mor) where
  initialMorphismClosed : ∀ (X : Obj), X ∈ Operad.objSet (U.operad) → U.initialMorphism X (by assumption) ∈ Operad.homSet (U.operad) (U.initialObject) X
  terminalMorphismClosed : ∀ (X : Obj), X ∈ Operad.objSet (U.operad) → U.terminalMorphism X (by assumption) ∈ Operad.homSet (U.operad) X (U.terminalObject)
  universalPropertyClosed : U.universalProperty

def UniversalConstructionClosed {Obj : Type u} {Mor : Type v}
    (U : UniversalConstructionPackage Obj Mor) : Prop :=
  (∀ (X : Obj), X ∈ Operad.objSet (U.operad) → U.initialMorphism X (by assumption) ∈ Operad.homSet (U.operad) (U.initialObject) X) ∧
  (∀ (X : Obj), X ∈ Operad.objSet (U.operad) → U.terminalMorphism X (by assumption) ∈ Operad.homSet (U.operad) X (U.terminalObject)) ∧
  U.universalProperty

theorem universal_construction_closed_from_evidence {Obj : Type u} {Mor : Type v}
    (U : UniversalConstructionPackage Obj Mor) (E : UniversalConstructionEvidence U) :
    UniversalConstructionClosed U :=
by
  exact And.intro E.initialMorphismClosed (And.intro E.terminalMorphismClosed E.universalPropertyClosed)

end HautevilleHouse
end CategoryTheoryOperadsCanonicalLaneLean