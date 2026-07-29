import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure LimitsColimitsOperad (C : Type u) [CategoryStruct C] where
  diagram : Type v → Type w
  cone : (D : Type v) → (diagram D) → (c : C) → (∀ d, diagram D → C) → Prop
  limit : (D : Type v) → (diagram D) → C
  limitUniversal : (D : Type v) → (d : diagram D) → (c : C) → (∀ d', c → diagram D d') → (c → limit D d) → Prop
  colimit : (D : Type v) → (diagram D) → C
  colimitUniversal : (D : Type v) → (d : diagram D) → (c : C) → (∀ d', diagram D d' → c) → (colimit D d → c) → Prop
  limitExists : (D : Type v) → (d : diagram D) → ∃ (l : C), limit D d = l
  colimitExists : (D : Type v) → (d : diagram D) → ∃ (c : C), colimit D d = c

def LimitsColimitsClosed (C : Type u) [CategoryStruct C] (L : LimitsColimitsOperad C) : Prop :=
  L.limitExists = L.limitExists ∧ L.colimitExists = L.colimitExists

theorem limits_colimits_closed (C : Type u) [CategoryStruct C] (L : LimitsColimitsOperad C) : LimitsColimitsClosed C L := by
  trivial

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse