import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadDefinitions

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure ColoredOperad (C : Type u) [Category C] where
  colors : Set C
  objects : (col1 col2 : colors) → Operad C
  exchange : ∀ (col1 col2 col3 : colors), (objects col1 col2).exp 1 ⊗ (objects col2 col3).exp 1 ⟶ (objects col1 col3).exp 1
  associativity : Prop
  unitality : Prop

structure ColoredOperadClosed (C : Type u) [Category C] (O : ColoredOperad C) : Prop :=
  colorsDefined : O.colors ≠ ∅
  exchangeCompatible : O.associativity ∧ O.unitality

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse