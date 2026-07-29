import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.OperadicStructure

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure KoszulDualityPair (O : OperadicStructure) where
  dualOperad : OperadicStructure
  quadraticData : Prop
  koszulComplex : Type u
  quasiIsomorphism : Prop
  koszulResolution : Prop

structure KoszulDualityEvidence {O : OperadicStructure} (K : KoszulDualityPair O) where
  dualOperadDefined : Prop
  quadraticDataClosed : K.quadraticData
  koszulComplexDefined : Prop
  quasiIsomorphismClosed : K.quasiIsomorphism
  koszulResolutionClosed : K.koszulResolution

def KoszulDualityClosed {O : OperadicStructure} (K : KoszulDualityPair O) : Prop :=
  K.quadraticData ∧ K.quasiIsomorphism ∧ K.koszulResolution

theorem koszul_duality_closed_from_evidence {O : OperadicStructure} (K : KoszulDualityPair O) (E : KoszulDualityEvidence K) : KoszulDualityClosed K := by
  exact And.intro E.quadraticDataClosed (And.intro E.quasiIsomorphismClosed E.koszulResolutionClosed)

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse