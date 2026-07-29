import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadDefinitions

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure Limit (C : Type u) [Category C] (J : Type v) [Category j] (F : J ⥤ C) where
  cone : Cone F
  universal : ∀ (c : Cone F), c ⟶ cone

structure Colimit (C : Type u) [Category C] (J : Type v) [Category j] (F : J ⥤ C) where
  cocone : Cocone F
  universal : ∀ (c : Cocone F), cocone ⟶ c

structure LimitsAndColimits (C : Type u) [Category C] where
  hasLimits : ∀ (J : Type v) [Category j] (F : J ⥤ C), Limit C J F
  hasColimits : ∀ (J : Type v) [Category j] (F : J ⥤ C), Colimit C J F
  commutes : Prop

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse