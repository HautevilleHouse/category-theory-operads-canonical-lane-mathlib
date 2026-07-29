import CategoryTheoryOperadsCanonicalLaneLean.OperadDefinitions

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure SymmetricOperad (O : Operad) where
  symmetricGroupAction : ∀ (n : ℕ), Equiv.Perm (O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier)) → 
    (O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier)) → (O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))
  compatibilityWithComposition : ∀ (n m : ℕ) (σ : Equiv.Perm (Fin n)) (τ : Equiv.Perm (Fin m)) 
    (f : O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier)) 
    (gs : (O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))^n),
    symmetricGroupAction (n + m) (σ.sum τ) (O.composition f gs) = O.composition (symmetricGroupAction n σ f) (fun i => symmetricGroupAction m (τ i) (gs i))

structure SymmetricOperadEvidence (O : Operad) (S : SymmetricOperad O) where
  compatibilityClosed : ∀ (n m : ℕ) (σ : Equiv.Perm (Fin n)) (τ : Equiv.Perm (Fin m)) 
    (f : O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier)) 
    (gs : (O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))^n),
    S.symmetricGroupAction (n + m) (σ.sum τ) (O.composition f gs) = O.composition (S.symmetricGroupAction n σ f) (fun i => S.symmetricGroupAction m (τ i) (gs i))

def SymmetricOperadClosed (S : SymmetricOperad O) : Prop :=
  ∀ (n m : ℕ) (σ : Equiv.Perm (Fin n)) (τ : Equiv.Perm (Fin m)) 
    (f : O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier)) 
    (gs : (O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))^n),
    S.symmetricGroupAction (n + m) (σ.sum τ) (O.composition f gs) = O.composition (S.symmetricGroupAction n σ f) (fun i => S.symmetricGroupAction m (τ i) (gs i))

theorem symmetric_operad_closed_from_evidence (O : Operad) (S : SymmetricOperad O) (E : SymmetricOperadEvidence O S) :
    SymmetricOperadClosed S := by
  exact E.compatibilityClosed

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse