import Foundation

/// A type-erased wrapper over any Incrementable
///
/// An `AnyIncrementable` instance forwards its operations to a base Incrementable,
/// hiding the specifics of the underlying Incrementable.
/// Simlar to AnyCollection, AnyHashable etc.
class AnyIncrementable: Incrementable {
  private let _incrementCount: () -> ()

  init<T: Incrementable>(_ base: T) {
    self._incrementCount = base.incrementCount
  }

  func incrementCount() {
    _incrementCount()
  }
}
