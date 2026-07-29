import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadDefinitions

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadAlgebra (C D : Type u) [Category C] [Category D] (O : Operad C) where
  carrier : D
  action : ∀ (n : ℕ), (O.exp n) ⊗ (carrier ^ (n : ℕ)) ⟶ carrier
  identity : Prop
  associativity : Prop

structure AlgebraMorphism (C D : Type u) [Category C] [Category D] (O : Operad C) (A B : OperadAlgebra C D O) where
  map : A.carrier ⟶ B.carrier
  compatibility : ∀ (n : ℕ), B.action n ∘ (𝟙 (O.exp n) ⊗ (map ^ (n : ℕ))) = map ∘ A.action n

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse