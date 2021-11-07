//
//  StorageAssembly.swift
//  
//
//  Created by Daniel Gomes on 12/10/21.
//

import Swinject
import SwinjectAutoregistration

class StorageAssembly: Assembly {

    func assemble(container: Container) {
//        container.register(KeychainStorage.self) { _ in KeychainStorage() }
//        container.register(UserDefaultsStorage.self) { _ in UserDefaultsStorage(userDefaults: .standard) }

//        container.autoregister(DataManager.ExampleLocalDataSource.self, initializer: Storage.ExampleLocalDataSource.init)
    }
}
