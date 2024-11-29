import SwiftUI

// These 2 Views are exactly the same, except the one which doesn't utilise Type Erasure `(MyViewGeneric)` requires the `Incrementable` type to be specified when `MyViewGeneric` is initialised.
// This is suboptimal, ideally the View wouldn't care about which type is being used, and wouldn't require it to be specified. The Type Erased `AnyIncrementable` achieves this in `MyViewTypeErased`

struct MyViewGeneric<GenericIncrementable: Incrementable>: View  {
  @EnvironmentObject var incrementable: GenericIncrementable
  @EnvironmentObject var viewState: ViewState

  var body: some View {
    Text("\(viewState.count)")

    Button {
      incrementable.incrementCount()
    } label: {
      Text("Increment")
    }

  }
}

struct MyViewTypeErased: View  {
  @EnvironmentObject var incrementable: AnyIncrementable
  @EnvironmentObject var viewState: ViewState

  var body: some View {
    Text("\(viewState.count)")

    Button {
      incrementable.incrementCount()
    } label: {
      Text("Increment")
    }

  }
}
