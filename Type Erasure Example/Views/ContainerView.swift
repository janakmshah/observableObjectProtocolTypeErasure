import SwiftUI

// `ContainerViewGeneric` doesn't directly reference `MyViewGeneric` but it is still being forced to pass the type `IncrementableImplementation` to it's child view.
// If we do not use Type Erasure this generic syntax will litter our Views even when `Incrementable` is not directly used by a view or it's child views.
// The Type Erased example underneath is much more like the SwiftUI we know and are used to, i.e. without generics.

struct ContainerViewGeneric: View {
  @StateObject var viewState: ViewState
  let incrementable: IncrementableImplementation

  init() {
    let viewState = ViewState()
    _viewState = StateObject(wrappedValue: viewState)
    incrementable = IncrementableImplementation(viewState: viewState)
  }

  var body: some View {
    MyViewListGeneric<IncrementableImplementation>()
      .environmentObject(incrementable)
      .environmentObject(viewState)
  }
}

struct ContainerViewTypeErased: View {
  @StateObject var viewState: ViewState
  let incrementable: AnyIncrementable

  init() {
    let viewState = ViewState()
    _viewState = StateObject(wrappedValue: viewState)
    incrementable = AnyIncrementable(IncrementableImplementation(viewState: viewState))
  }

  var body: some View {
    MyViewListTypeErased()
      .environmentObject(incrementable)
      .environmentObject(viewState)
  }
}
