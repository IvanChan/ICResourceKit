//
//  ICResEnvironmentConfigurator.swift
//  Ico
//
//  Created by _ivanC on 15/01/2018.
//  Copyright © 2018 Ico. All rights reserved.
//

import UIKit
import ICFoundation

public class ICResEnvironmentConfigurator: NSObject {
    public static let shared = ICResEnvironmentConfigurator()
    
    public var relativeResMainPath: String = ""

    public var fullResMainPath: String {
        get {
            if let rPath = Bundle.main.resourcePath {
                return rPath.ic_stringByAppendingPathComponent(path: self.relativeResMainPath)
            }
            return ""
        }
    }
    
    var relativePresetThemeMainPath: String {
        get {
            return self.relativeResMainPath.ic_stringByAppendingPathComponent(path: "Themes")
        }
    }
    
    var languageMainPath: String {
        get {
            return self.fullResMainPath.ic_stringByAppendingPathComponent(path: "Languages")
        }
    }
    

    public var downloadedSkinMainPath: String?

}
