import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure LimitColimitPackage (I : Type u) (C : Type v) (MorC : Type w) where
  operadC : Operad C MorC
  diagram : I → C
  cone : Type (max u v)
  cocone : Type (max u v)
  limitObject : C
  colimitObject : C
  limitProperty : Prop
  colimitProperty : Prop
  limitPropertyTerm : limitProperty
  colimitPropertyTerm : colimitProperty

structure LimitColimitEvidence {I : Type u} {C : Type v} {MorC : Type w}
    (L : LimitColimitPackage I C MorC) where
  limitPropertyClosed : L.limitProperty
  colimitPropertyClosed : L.colimitProperty

def LimitColimitClosed {I : Type u} {C : Type v} {MorC : Type w}
    (L : LimitColimitPackage I C MorC) : Prop :=
  L.limitProperty ∧ L.colimitProperty

theorem limit_colimit_closed_from_evidence {I : Type u} {C : Type v} {MorC : Type w}
    (L : LimitColimitPackage I C MorC) (E : LimitColimitEvidence L) :
    LimitColimitClosed L :=
by
  exact And.intro E.limitPropertyClosed E.colimitPropertyClosed

end HautevilleHouse
end CategoryTheoryOperadsCanonicalLaneLean