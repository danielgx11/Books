//
//  File.swift
//  
//
//  Created by Daniel Gomes on 07/11/21.
//

import UIKit

// swiftlint:disable implicit_getter
public struct Orientation {

    static var isLandscape: Bool {
        get {
            UIDevice.current.orientation.isValidInterfaceOrientation
            ? UIDevice.current.orientation.isLandscape
            : UIApplication.shared.statusBarOrientation.isLandscape
        }
    }

    static var isPortrait: Bool {
        get {
            UIDevice.current.orientation.isValidInterfaceOrientation
            ? UIDevice.current.orientation.isPortrait
            : UIApplication.shared.statusBarOrientation.isPortrait
        }
    }
}
