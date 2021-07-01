//
//  BindingExtenson.swift
//  Kouti
//
//  Created by Marco Zulian on 29/06/21.
//

import Foundation
import SwiftUI

extension Binding where Value: MutableCollection
{
  subscript(safe index: Value.Index) -> Binding<Value.Element>
  {
    // Get the value of the element when we first create the binding
    // Thus we have a 'placeholder-value' if `get` is called when the index no longer exists
    let safety = wrappedValue[index]
    return Binding<Value.Element>(
      get: {
        guard self.wrappedValue.indices.contains(index)
          else { return safety } //If this index no longer exists, return a dummy value
        return self.wrappedValue[index]
    },
      set: { newValue in
        guard self.wrappedValue.indices.contains(index)
          else { return } //If this index no longer exists, do nothing
        self.wrappedValue[index] = newValue
    })
  }
}
