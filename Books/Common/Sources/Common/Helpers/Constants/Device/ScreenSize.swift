//
//  ScreenSize.swift
//  
//
//  Created by Daniel Gomes on 07/11/21.
//

import UIKit

public struct ScreenSize {

    public static let width = UIScreen.main.bounds.size.width
    public static let height = UIScreen.main.bounds.size.height
    public static let maxLenght = max(ScreenSize.width, ScreenSize.height)
    public static let minLenght = min(ScreenSize.width, ScreenSize.height)
    public static let isLarge: Bool = ScreenSize.width > 375

    public static func returnOnSmall<T>(_ onSmall: T, or onLarge: T) -> T {
        isLarge ? onLarge : onSmall
    }
}
