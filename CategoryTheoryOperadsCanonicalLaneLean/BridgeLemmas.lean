import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryOperadsCanonicalLaneLean

def bridgeClosed (A : OperadAdmissibleClass) : Prop :=
  OperadWitnessClosed A.object

theorem bridge_from_admissible_class (A : OperadAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryOperadsCanonicalLaneLean
end HautevilleHouse
