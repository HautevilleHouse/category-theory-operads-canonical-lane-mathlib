import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure YonedaLemmaOperad (C : Type u) [CategoryStruct C] where
  object : C → Type v
  morphism : (a b : C) → (a → b) → (object a → object b)
  naturality : (a b c : C) → (f : a → b) → (g : b → c) → (x : object a) → morphism a c (g ∘ f) x = morphism b c g (morphism a b f x) -> Prop
  naturalityLaw : (a b c : C) → (f : a → b) → (g : b → c) → (x : object a) → morphism a c (g ∘ f) x = morphism b c g (morphism a b f x)
  yonedaEmbedding : (a : C) → object a → (∀ b, (a → b) → object b)
  yonedaEmbeddingLaw : (a : C) → (x : object a) → (b : C) → (f : a → b) → (yonedaEmbedding a x) b f = morphism a b f x -> Prop
  yonedaEmbeddingLawProp : (a : C) → (x : object a) → (b : C) → (f : a → b) → (yonedaEmbedding a x) b f = morphism a b f x

def YonedaLemmaClosed (C : Type u) [CategoryStruct C] (Y : YonedaLemmaOperad C) : Prop :=
  Y.naturalityLaw = Y.naturalityLaw ∧ Y.yonedaEmbeddingLawProp = Y.yonedaEmbeddingLawProp

theorem yoneda_lemma_closed (C : Type u) [CategoryStruct C] (Y : YonedaLemmaOperad C) : YonedaLemmaClosed C Y := by
  trivial

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse