import SwiftUI

class ViewState: ObservableObject {
  @Published var count: Int = 0
}

protocol Incrementable: ObservableObject {
  func incrementCount()
}

class IncrementableImplementation: Incrementable {
  private let viewState: ViewState

  init (viewState: ViewState) {
    self.viewState = viewState
  }

  func incrementCount() {
    viewState.count += 1
  }
}
