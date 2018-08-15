//
//  Array.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import Foundation

extension Array {
    
    func chunkBy(_ chunkSize: Int) -> [[Element]] {
        return stride(from: 0, to: self.count, by: chunkSize).map {
            Array(self[$0..<Swift.min($0 + chunkSize, self.count)])
        }
    }
    
}
