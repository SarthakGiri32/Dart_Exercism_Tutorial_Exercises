// Implement the Classification enum.
enum Classification {
  equal,
  unequal,
  superlist,
  sublist
}

class Sublist {
  Classification sublist(List<int> a, List<int> b) {
    if (a.length == b.length) {
      if (a.isEmpty && b.isEmpty) return Classification.equal;
      for (int i = 0; i < a.length; i++) {
        if (a[i] != b[i]) {
          return Classification.unequal;
        }
      }
      return Classification.equal;
    }
    else {
      if (a.isEmpty) return Classification.sublist;
      else if (b.isEmpty) return Classification.superlist;
      else {
        List<int> smallerList = [], biggerList = [];
        if (a.length < b.length) {
          smallerList = [...a]; biggerList = [...b];
        } else if (a.length > b.length) {
          smallerList = [...b]; biggerList = [...a];
        }
        for (int i = 0; i <= biggerList.length - smallerList.length; i++) {
          var sublistMatch = true;
          for (int j = 0; j < smallerList.length; j++) {
            if (biggerList[i + j] != smallerList[j]) {
              sublistMatch = false;
              break;
            }
          }
          if (sublistMatch) {
            if (_equals(smallerList, a) && _equals(biggerList, b)) return Classification.sublist;
            else if (_equals(smallerList, b) && _equals(biggerList, a)) return Classification.superlist;
          };
        }
        return Classification.unequal;
      }
    }
  }

  bool _equals(List<int> list1, List<int> list2) {
    if (list1.length != list2.length) return false;
    for (var i = 0; i < list1.length; i++) if (list1[i] != list2[i]) return false;
    return true;
  }
}
