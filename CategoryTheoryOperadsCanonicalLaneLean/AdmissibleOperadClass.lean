import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

structure AdmissibleOperadObject where
  operadType : Type u
  operad : OperadStructure operadType
  underlyingCategory : Type v
  closureCondition : Prop
  conclusion : closureCondition

def OperadWitnessClosed (O : AdmissibleOperadObject) : Prop :=
  O.closureCondition

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse