//
//  CoordinatorFactory.swift
//  
//
//  Created by Daniel Gomes on 20/10/21.
//

import Foundation
import Login

public protocol CoordinatorFactory: DependencyFactory {

    func makeLoginCoordinator() -> LoginCoordinator
}
