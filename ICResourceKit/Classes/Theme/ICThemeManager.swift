//
//  ICThemeManager.swift
//  Ico
//
//  Created by _ivanC on 12/01/2018.
//  Copyright © 2018 Ico. All rights reserved.
//

import UIKit
import ICObserver
import ICFoundation

enum ICPresetTheme: String {
    case classic = "Classic"
    case nightMode = "NightMode"
}

protocol ICThemeManagerObserver {
    func willThemeChage()
    func didThemeChaged()
}

class ICThemeManager: ICObserverTable {
    static let shared = ICThemeManager()
    
    private(set) lazy var baseTheme:ICThemeInfo = {
        let themeInfo = ICThemeInfo(name: ICPresetTheme.classic.rawValue, mode: .classic, type: .preset, baseDir: ICResEnvironmentConfigurator.shared.fullResMainPath.ic_stringByAppendingPathComponent(path: "Themes/Classic"))
        return themeInfo
    }()
    
    private(set) var currentTheme:ICThemeInfo?
    
    public func loadTheme(theme: ICThemeInfo) -> Bool {
        
        if self.currentTheme?.name == theme.name {
            return true
        }
        
        if !theme.load() {
            return false
        }
        
        self.notifyObserversThemeWillChanged()
        
        self.currentTheme?.unload()
        self.currentTheme = theme
        
        self.notifyObserversThemeDidChanged()
        
        return true
    }
    
    public func loadTheme(named: String) -> Bool {
        if named.count <= 0 {
            return false
        }
        
        var nextTheme:ICThemeInfo?
        switch named {
        case ICPresetTheme.classic.rawValue:
            nextTheme = self.baseTheme
            break
        case ICPresetTheme.nightMode.rawValue:
            nextTheme = ICThemeInfo(name: ICPresetTheme.nightMode.rawValue, mode: .nightMode, type: .preset, baseDir: ICResEnvironmentConfigurator.shared.fullResMainPath.ic_stringByAppendingPathComponent(path: "Themes/NightMode"))
            break
        default:
            if let downloadedPath = ICResEnvironmentConfigurator.shared.downloadedSkinMainPath {
                let path = downloadedPath.ic_stringByAppendingPathComponent(path: named)
                if FileManager.default.fileExists(atPath: path) {
                    
                    // Maybe we should check whether data is valid
                    nextTheme = ICThemeInfo(name: named, mode: .classic, type: .download, baseDir: path)
                }
            }
        }
        
        if let toLoadTheme = nextTheme {
            return self.loadTheme(theme: toLoadTheme)
        }
        
        return false
    }
    
    private func notifyObserversThemeWillChanged() {
        self.enumerateObserverOnMainThread { (observer) in
            let ob:ICThemeManagerObserver = observer as! ICThemeManagerObserver
            ob.willThemeChage()
        }
    }
    
    private func notifyObserversThemeDidChanged() {
        self.enumerateObserverOnMainThreadAsync { (observer) in
            let ob:ICThemeManagerObserver = observer as! ICThemeManagerObserver
            ob.didThemeChaged()
        }
    }
}
