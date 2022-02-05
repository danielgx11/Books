//
//  DeviceType.swift
//  
//
//  Created by Daniel Gomes on 07/11/21.
//

import UIKit

public struct DeviceType {

    public static let isiPhone4OrLess =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght < 568.0
    public static let isiPhone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght == 568.0
    public static let isiPhone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght == 667.0
    public static let isiPhone6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght == 736.0
    public static let isiPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght == 812.0
    public static let isiPhoneXorGreater = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLenght >= 812.0
}
