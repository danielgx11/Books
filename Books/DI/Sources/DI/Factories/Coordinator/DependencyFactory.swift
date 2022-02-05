//
//  DependencyFactory.swift
//  
//
//  Created by Daniel Gomes on 20/10/21.
//

import Swinject

public protocol DependencyFactory: AnyObject {

    init(resolver: Resolver)
}
