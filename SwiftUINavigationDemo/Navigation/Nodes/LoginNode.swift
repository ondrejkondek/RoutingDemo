//
//  LoginNode.swift
//  SwiftUINavigationDemo
//
//  Created by Ondrej Kondek on 15/10/2024.
//

import Common
import Foundation

struct LoginNode: Node {
    let id: String = String(describing: type(of: LoginNode.self))
    let completion: (@MainActor (Bool) -> Void)?
    
    public init(completion: (@MainActor (Bool) -> Void)? = nil) {
        self.completion = completion
    }
    
    nonisolated static func == (lhs: LoginNode, rhs: LoginNode) -> Bool {
        lhs.id == rhs.id
    }
    
    nonisolated public func hash(into hasher: inout Hasher) {
         hasher.combine(id)
     }
}
