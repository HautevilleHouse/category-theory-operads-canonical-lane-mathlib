import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryOperadsCanonicalLaneLean.AdmissibleOperadClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.conclusion

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse