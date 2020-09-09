//
//  DemoThemeMachine.swift
//  FZTheme_Example
//
//  Created by FranZhou on 2020/9/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation
import FZTheme
import FZBuildingBlock

public struct DemoThemeMachine {

    public var themeStyle: FZThemeStyle

    init(themeStyle: FZThemeStyle) {
        self.themeStyle = themeStyle
    }

}

extension DemoThemeMachine: FZThemeMachineProtocol {

    public func themeColor(withIdentifier identifier: String, themeStyle: FZThemeStyle, defaultColor: UIColor?) -> UIColor? {
        if let colorStr = StringsFileUtil.localizedString(forKey: identifier, inTable: self.themeStyle.themeName) {
            return UIColor.fz.color(rgbHexString: colorStr)
        }
        return defaultColor
    }

    public func themeImage(withIdentifier identifier: String, themeStyle: FZThemeStyle, defaultImage: UIImage?) -> UIImage? {
        if let colorStr = StringsFileUtil.localizedString(forKey: identifier, inTable: self.themeStyle.themeName) {
            return UIImage.fz.image(withColor: UIColor.fz.color(rgbHexString: colorStr), size: CGSize(width: 200, height: 200))
        }
        return defaultImage
    }
}
