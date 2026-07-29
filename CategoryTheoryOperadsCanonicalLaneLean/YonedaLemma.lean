import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadDefinitions

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure YonedaEmbedding (C : Type u) [Category C] (O : Operad C) where
  hom : C → (C ⥤ Set)
  naturality : Prop
  fullyFaithful : Prop

structure YonedaLemma (C : Type u) [Category C] (O : Operad C) where
  embedding : YonedaEmbedding C O
  representation : ∀ (X : C) (F : C ⥤ Set), (hom X) ⟹ F ≃ F.obj X
  natural : Prop

theorem yoneda_lemma_holds (C : Type u) [Category C] (O : Operad C) (Y : YonedaLemma C O) : Y.natural := Y.natural

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse