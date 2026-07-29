import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure Operad (C : Type u) [Category.{v} C] where
  objs : Set C
  arities : C → ℕ
  compositions : (n : ℕ) → (f : C) → (g : Fin (arities f) → C) → C
  identities : (x : C) → C
  associativity : ∀ (n : ℕ) (f : C) (g : Fin (arities f) → C) (h : (i : Fin (arities f)) → Fin (arities (g i)) → C), 
    compositions n f (λ i => compositions (arities (g i)) (g i) (h i)) = compositions (∑ i, arities (g i)) (compositions n f g) (λ j => ?_) 
  unitality : ∀ (x : C), compositions 0 (identities x) (λ _ => x) = x ∧ compositions 1 x (λ _ => identities x) = x

structure SymmetricOperad (C : Type u) [Category.{v} C] extends Operad C where
  symmetric : (n : ℕ) → (f : C) → (σ : Perm (Fin (arities f))) → C
  equivariance : ∀ (n : ℕ) (f : C) (σ : Perm (Fin (arities f))) (g : Fin (arities f) → C),
    compositions n (symmetric n f σ) g = compositions n f (g ∘ σ.symm)

structure OperadMorphism (O1 O2 : Operad C) where
  map : C → C
  preserves_compositions : ∀ (n : ℕ) (f : C) (g : Fin (arities f) → C), 
    map (O1.compositions n f g) = O2.compositions n (map f) (λ i => map (g i))
  preserves_identities : ∀ (x : C), map (O1.identities x) = O2.identities (map x)

def OperadCategory (C : Type u) [Category.{v} C] : Category (Operad C) where
  Hom O1 O2 := OperadMorphism O1 O2
  id O := { map := λ x => x, preserves_compositions := by intro n f g; rfl, preserves_identities := by intro x; rfl }
  comp f g := { map := g.map ∘ f.map, 
    preserves_compositions := by
      intro n f h
      calc
        (g.map ∘ f.map) (fst.compositions n f h) = g.map (f.map (fst.compositions n f h)) := rfl
        _ = g.map (snd.compositions n (f.map f) (λ i => f.map (h i))) := by rw [f.preserves_compositions]
        _ = trd.compositions n (g.map (f.map f)) (λ i => g.map (f.map (h i))) := by rw [g.preserves_compositions]
        _ = (g.map ∘ f.map) (fst.compositions n f h) := rfl
    ,
    preserves_identities := by
      intro x
      calc
        (g.map ∘ f.map) (fst.identities x) = g.map (f.map (fst.identities x)) := rfl
        _ = g.map (snd.identities (f.map x)) := by rw [f.preserves_identities]
        _ = trd.identities (g.map (f.map x)) := by rw [g.preserves_identities]
        _ = (g.map ∘ f.map) (fst.identities x) := rfl
  }

structure AdmittedOperadObject where
  operad : Operad Set
  isSymmetric : Bool
  admitsYoneda : Prop
  conclusion : admitsYoneda

structure OperadAdmissibleClass where
  object : AdmittedOperadObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def OperadWitnessClosed (O : AdmittedOperadObject) : Prop :=
  O.admitsYoneda

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
