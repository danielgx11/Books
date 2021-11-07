//
//  File.swift
//  
//
//  Created by Daniel Gomes on 07/11/21.
//

import UIKit

public extension UINavigationBar {

    func asBooksNavigationBar() {
        self.tintColor = ColorName.marineBlue
        self.backgroundColor = .white
        self.isTranslucent = false
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        let font = FontFamily.RubikMedium.regular.font(size: ScreenSize.returnOnSmall(16, or: 18))
        self.titleTextAttributes = [.foregroundColor: ColorName.marineBlue, .font: font]
    }
}
