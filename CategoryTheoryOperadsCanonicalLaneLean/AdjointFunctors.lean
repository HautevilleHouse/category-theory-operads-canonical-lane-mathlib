import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadDefinitions

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure AdjointPair (C D : Type u) [Category C] [Category D] (F : C ⥤ D) (G : D ⥤ C) where
  unit : 𝟙 C ⟹ G ⋙ F
  counit : F ⋙ G ⟹ 𝟙 D
  triangle1 : ∀ (X : C), (unit.app X) ▷ (F.map (counit.app (F.obj X))) = 𝟙 (F.obj X)
  triangle2 : ∀ (Y : D), (counit.app Y) ▷ (G.map (unit.app (G.obj Y))) = 𝟙 (G.obj Y)

structure AdjointFunctor (C D : Type u) [Category C] [Category D] where
  leftAdjoint : C ⥤ D
  rightAdjoint : D ⥤ C
  pair : AdjointPair C D leftAdjoint rightAdjoint

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse