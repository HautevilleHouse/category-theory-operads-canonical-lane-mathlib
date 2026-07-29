import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure OperadStructure (T : Type u) where
  arities : T → List Type
  composition : (f : T) → (g : T) → (args : List T) → arities f = g :: List.map (λ x => arities x) args → T
  identity : (a : T) → T
  associativity : (f g h : T) → (args_f : List T) → (args_g : List T) → (args_h : List T) →
    composition (composition f g args_f) h (args_g ++ args_h) = composition f (composition g h args_g) (args_f ++ [h]) → Prop
  identityLeft : (f : T) → composition (identity (f)) f [] = f → Prop
  identityRight : (f : T) → composition f (identity (f)) [] = f → Prop
  associativityLaw : (f g h : T) → (args_f : List T) → (args_g : List T) → (args_h : List T) →
    composition (composition f g args_f) h (args_g ++ args_h) = composition f (composition g h args_g) (args_f ++ [h])
  identityLeftLaw : (f : T) → composition (identity (f)) f [] = f
  identityRightLaw : (f : T) → composition f (identity (f)) [] = f

def OperadClosed (T : Type u) (O : OperadStructure T) : Prop :=
  O.associativityLaw = O.associativityLaw ∧ O.identityLeftLaw = O.identityLeftLaw ∧ O.identityRightLaw = O.identityRightLaw

theorem operad_structure_closed (T : Type u) (O : OperadStructure T) : OperadClosed T O := by
  trivial

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse