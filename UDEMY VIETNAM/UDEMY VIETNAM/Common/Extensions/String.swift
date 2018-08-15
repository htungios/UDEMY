//
//  String.swift
//  Part On Demand
//
//  Created by TungHN on 2/12/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

extension String {
    
    public func trim() -> String {
        return trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    public func index(of char: Character) -> Int? {
        if let idx = characters.index(of: char) {
            return characters.distance(from: startIndex, to: idx)
        }
        return nil
    }
    
}
