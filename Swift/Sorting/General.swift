//
//  General.swift
//  Sorting
//
//  Created by Paul Kraft on 02.08.16.
//  Copyright © 2016 pauljohanneskraft. All rights reserved.
//

import Foundation

infix operator <-> { associativity left precedence 140 }
func <-> <T>( left: inout T, right: inout T) {
    swap(&left, &right)
}

public extension SortableCollection {
    public func isSorted(by order: (Element, Element) throws -> Bool) rethrows -> Bool {
        for i in self.indices.dropLast() {
            if try order(self[i + 1], self[i]) {
                // print(self[i + 1], "at", i + 1, "\t<\t", self[i], "at", i)
                return false
            }
        }
        return true
    }
}

public extension SortableCollection where Element : Comparable {
    public var isSorted : Bool {
        return isSorted(by: { $0 < $1 })
    }
}


