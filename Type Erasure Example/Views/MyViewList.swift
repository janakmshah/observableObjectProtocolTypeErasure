import SwiftUI

// This file shows the biggest benefit of using Type Erasure. The Views below are simple `List`s which contain `MyView` i.e. the View which uses the protocol-defined data type.
// The one which has not been type-erased `(MyViewListGeneric)` needs to now know about `Incrementable`, as would any parent view in the chain until we reach the View where a concrete type conforming to Incrementable is defined.
// This clutters our Views with information they shouldn't care about, and quickly becomes tiresome especially if there is more than one Generic required.
// As can be seen in `MyViewListTypeErased` this View has been kept clean without any knowledge of `Incrementable`.

struct MyViewListGeneric<GenericIncrementable: Incrementable>: View {
  var body: some View {
    List {
      MyViewGeneric<GenericIncrementable>()
    }
  }
}

struct MyViewListTypeErased: View {
  var body: some View {
    List {
      MyViewTypeErased()
    }
  }
}
