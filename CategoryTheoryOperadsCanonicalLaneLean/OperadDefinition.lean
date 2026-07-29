import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure Operad (Obj : Type u) (Mor : Type v) where
  objSet : Set Obj
  homSet : Obj → Obj → Set Mor
  identity : ∀ (X : Obj), X ∈ objSet → Mor
  composition : ∀ (X Y Z : Obj) (f : Mor) (g : Mor),
    X ∈ objSet → Y ∈ objSet → Z ∈ objSet →
    f ∈ homSet X Y → g ∈ homSet Y Z → Mor
  unitLaw : ∀ (X Y : Obj) (f : Mor),
    X ∈ objSet → Y ∈ objSet → f ∈ homSet X Y →
    composition X X Y (identity X (by assumption)) f = f ∧
    composition X Y Y f (identity Y (by assumption)) = f
  assocLaw : ∀ (X Y Z W : Obj) (f g h : Mor)
    (hX : X ∈ objSet) (hY : Y ∈ objSet) (hZ : Z ∈ objSet) (hW : W ∈ objSet)
    (hf : f ∈ homSet X Y) (hg : g ∈ homSet Y Z) (hh : h ∈ homSet Z W),
    composition X Z W (composition X Y Z f g) h = composition X Y W f (composition Y Z W g h)

structure OperadPackage where
  obj : Type u
  mor : Type v
  operad : Operad obj mor
  smallObj : obj ∈ Operad.objSet (operad)
  smallMor : ∀ (X Y : obj), mor ∈ Operad.homSet (operad) X Y

structure OperadPackageEvidence (P : OperadPackage) where
  smallObjClosed : P.smallObj
  smallMorClosed : ∀ (X Y : P.obj), P.smallMor X Y

def OperadPackageClosed (P : OperadPackage) : Prop :=
  P.smallObj ∧ ∀ (X Y : P.obj), P.smallMor X Y

theorem operad_package_closed_from_evidence (P : OperadPackage) (E : OperadPackageEvidence P) :
    OperadPackageClosed P :=
by
  exact And.intro E.smallObjClosed E.smallMorClosed

end HautevilleHouse
end CategoryTheoryOperadsCanonicalLaneLean