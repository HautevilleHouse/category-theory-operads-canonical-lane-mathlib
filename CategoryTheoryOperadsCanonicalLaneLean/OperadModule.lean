import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadicStructure
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadAlgebra

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadModule {O : OperadicStructure} (A : OperadAlgebra O) where
  carrier : Type u
  moduleAction : O.operations → A.carrier → carrier → carrier
  moduleIdentity : ∀ (a : A.carrier) (x : carrier), moduleAction O.unit a x = a ⊗ x  -- assuming some tensor?
  moduleComposition : ∀ (f : O.operations) (gs : List O.operations) (a : A.carrier) (xs : List carrier), 
    moduleAction f a (mapModuleAction gs xs) = moduleAction (O.composition f gs) (A.action f a) xs
  moduleEquivariance : ∀ (f : O.operations) (σ : Equiv.Perm (O.arity f)) (a : A.carrier) (xs : List carrier), 
    moduleAction (O.symmetricGroupAction (O.arity f) f σ) a xs = moduleAction f a (permuteList σ xs)

structure OperadModuleEvidence {O : OperadicStructure} {A : OperadAlgebra O} (M : OperadModule A) where
  moduleActionDefined : Prop
  moduleIdentityClosed : M.moduleIdentity
  moduleCompositionClosed : M.moduleComposition
  moduleEquivarianceClosed : M.moduleEquivariance

def OperadModuleClosed {O : OperadicStructure} {A : OperadAlgebra O} (M : OperadModule A) : Prop :=
  M.moduleIdentity ∧ M.moduleComposition ∧ M.moduleEquivariance

theorem operad_module_closed_from_evidence {O : OperadicStructure} {A : OperadAlgebra O} (M : OperadModule A) (E : OperadModuleEvidence M) : OperadModuleClosed M := by
  exact And.intro E.moduleIdentityClosed (And.intro E.moduleCompositionClosed E.moduleEquivarianceClosed)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse