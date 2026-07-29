import CategoryTheoryOperadsCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic
import Mathlib.CategoryTheory.Category.Basic
import Mathlib.CategoryTheory.Operad.Basic

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure OperadSpace where
  carrier : Type
  categoryStructure : CategoryTheory.CategoryStruct carrier

structure OperadAdmittedObject where
  space : OperadSpace
  operadStructure : Operad carrier
  yonedaFullFaithful : Prop
  conclusion : yonedaFullFaithful

structure OperadEndgameState where
  object : OperadAdmittedObject

def OperadWitnessClosed (O : OperadAdmittedObject) : Prop :=
  O.yonedaFullFaithful

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
