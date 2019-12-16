//
//  Cache.swift
//  3DTEST
//
//  Created by Robin Yu on 16/12/2019.
//  Copyright © 2019 Robin Yu. All rights reserved.
//

import UIKit

class Cache: NSObject {
    static let temp = Cache()
    var threeDimensionMode = false
    var objectsWithDepth = [NSObject:Bool]()
}

extension NSObject {
    var isDepthShown:Bool {
        get {
            if let isDepthShown = Cache.temp.objectsWithDepth[self] {
                return isDepthShown
            }
            return false
        }
        set {
            Cache.temp.objectsWithDepth[self] = newValue
        }
    }
}

extension Bool {
  mutating func toggle() {
    self = !self
  }
}
