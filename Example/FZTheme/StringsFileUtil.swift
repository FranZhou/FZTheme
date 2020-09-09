//
//  StringsFileUtil.swift
//  FZTheme_Example
//
//  Created by FranZhou on 2020/9/9.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

public struct StringsFileUtil {

    public static func localizedString(forKey key: String, inTable table: String) -> String? {
        return Bundle.main.localizedString(forKey: key, value: nil, table: table)
    }

}
