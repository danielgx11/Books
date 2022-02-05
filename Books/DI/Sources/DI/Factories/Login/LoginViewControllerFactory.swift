//
//  File.swift
//  
//
//  Created by Daniel Gomes on 20/10/21.
//

import UIKit
import Login

public protocol LoginViewControllerFactory: DependencyFactory {

    func registerLoginViewController()
}
