//
//  Protocols.swift
//
//  Copyright © 2017 OPS PH. All rights reserved.
//

import Foundation

protocol ReuseIdentifiable {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifiable {
    static var reuseIdentifier: String { return "\(String(describing: Self.self))ReuseIdentifier" }
}
