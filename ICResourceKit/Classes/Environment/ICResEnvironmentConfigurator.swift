//
//  ICResEnvironmentConfigurator.swift
//  Ico
//
//  Created by _ivanC on 15/01/2018.
//  Copyright © 2018 Ico. All rights reserved.
//

import UIKit
import ICFoundation

class ICResEnvironmentConfigurator: NSObject {
    static let shared = ICResEnvironmentConfigurator()
    
    var relativeResMainPath: String = "res"
    var relativePresetThemeMainPath: String = "res/Themes/"

    var fullResMainPath: String {
        get {
            if let rPath = Bundle.main.resourcePath {
                return rPath.ic_stringByAppendingPathComponent(path: self.relativeResMainPath)
            }
            return ""
        }
    }

    var downloadedSkinMainPath: String?

}
