import CategoryTheoryOperadsCanonicalLaneLean.OperadDefinitions

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure AlgebraOverOperad (O : Operad) (X : Type u) where
  action : ∀ (n : ℕ) (f : O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier)),
    (X^n) → X
  unitAction : X → action 0 (O.identities (O.carrier O.carrier O.carrier)) ()
  compositionAction : ∀ (n m : ℕ) (f : O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))
    (gs : (O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))^n)
    (xs : (X^m)^n),
    action m (O.composition f (fun i => gs i)) (concat xs) = action n f (fun i => action m (gs i) (xs i))

structure AlgebraEvidence (O : Operad) (A : AlgebraOverOperad O X) where
  unitActionClosed : A.unitAction = (fun x => x)
  compositionActionClosed : ∀ (n m : ℕ) (f : O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))
    (gs : (O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))^n)
    (xs : (X^m)^n),
    A.action m (O.composition f (fun i => gs i)) (concat xs) = A.action n f (fun i => A.action m (gs i) (xs i))

def AlgebraOverOperadClosed (A : AlgebraOverOperad O X) : Prop :=
  A.unitAction = (fun x => x) ∧
  ∀ (n m : ℕ) (f : O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))
    (gs : (O.carrier (O.carrier O.carrier O.carrier) (O.carrier O.carrier O.carrier))^n)
    (xs : (X^m)^n),
    A.action m (O.composition f (fun i => gs i)) (concat xs) = A.action n f (fun i => A.action m (gs i) (xs i))

theorem algebra_over_operad_closed_from_evidence (A : AlgebraOverOperad O X) (E : AlgebraEvidence O A) :
    AlgebraOverOperadClosed A := by
  exact And.intro E.unitActionClosed E.compositionActionClosed

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse