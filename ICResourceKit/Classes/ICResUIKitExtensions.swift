//
//  ICResUIKitExtensions.swift
//  Ico
//
//  Created by _ivanC on 15/01/2018.
//  Copyright © 2018 Ico. All rights reserved.
//

import UIKit

extension UIView {

    private static let ICBackgroundColorResKey = "ICBackgroundColorKey"

    internal func ic_resHash() -> [String:Any] {
        var resHash:[String:Any]? = objc_getAssociatedObject(self, "ICResHashAssociatedKey") as? [String:Any]
        if resHash == nil {
            resHash = [:]
            objc_setAssociatedObject(self, "ICResHashAssociatedKey", resHash, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            ICThemeManager.shared.addObserver(self)
        }
        return resHash!
    }
    
    internal func ic_setResValue(_ value:Any, forKey:String) {
        var resHash = self.ic_resHash()
        resHash[forKey] = value
    }
    
    internal func ic_resValue(_ forKey:String) -> Any? {
        return self.ic_resHash()[forKey]
    }
    
    //-------------- background color -----------------
    public func setBackgroundColor(forICResName key:String) {
        self.ic_setResValue(key, forKey: UIView.ICBackgroundColorResKey)
        self.backgroundColor = resGetColor(key)
    }
    
    @objc func didThemeChanged() {
        if let bgColorResKey:String = self.ic_resValue(UIView.ICBackgroundColorResKey) as? String {
            self.backgroundColor = resGetColor(bgColorResKey)
        }
    }
    
    @objc func didLanguageChanged() {
        
    }
}

extension UIButton {
    
    private static let ICTitleHashKey = "ICTitleHashKey"
    private static let ICTitleColorHashKey = "ICTitleColorHashKey"

    private static let ICImageHashKey = "ICImageHashKey"
    private static let ICBgImageHashKey = "ICBgImageHashKey"

    internal func ic_resStateHash(_ key: String) -> [UInt:String] {
        var hash:[UInt:String]? = self.ic_resValue(key) as? [UInt:String]
        if hash == nil {
            hash = [:]
            self.ic_setResValue(hash!, forKey: key)
        }
        return hash!
    }
    
    internal func ic_saveResKey(_ key:String, forHash: [UInt:String]) {
        var hash = forHash
        hash[state.rawValue] = key
    }
    
    //-------------- title -----------------
    public func setTitle(forICResName key:String, state: UIControlState) {
        self.ic_saveResKey(key, forHash: self.ic_resStateHash(UIButton.ICTitleHashKey))
        self.setTitle(resGetText(key), for: state)
    }

    //-------------- title color -----------------
    public func setTitleColor(forICResName key:String, state: UIControlState) {
        self.ic_saveResKey(key, forHash: self.ic_resStateHash(UIButton.ICTitleColorHashKey))
        self.setTitleColor(resGetColor(key), for: state)
    }
    
    //-------------- image -----------------
    public func setImage(forICResName key:String, state: UIControlState) {
        self.ic_saveResKey(key, forHash: self.ic_resStateHash(UIButton.ICImageHashKey))
        self.setImage(resGetImage(key), for: state)
    }
    
    //-------------- background image -----------------
    public func setBackgroundImage(forICResName key:String, state: UIControlState) {
        self.ic_saveResKey(key, forHash: self.ic_resStateHash(UIButton.ICBgImageHashKey))
        self.setBackgroundImage(resGetImage(key), for: state)
    }
    
    override func didThemeChanged() {
        super.didThemeChanged()
        
        for (key, value) in self.ic_resStateHash(UIButton.ICTitleColorHashKey) {
            self.setTitleColor(resGetColor(value), for: UIControlState(rawValue: key))
        }
        
        for (key, value) in self.ic_resStateHash(UIButton.ICImageHashKey) {
            self.setImage(resGetImage(value), for: UIControlState(rawValue: key))
        }
        
        for (key, value) in self.ic_resStateHash(UIButton.ICBgImageHashKey) {
            self.setBackgroundImage(resGetImage(value), for: UIControlState(rawValue: key))
        }
    }
    
    override func didLanguageChanged() {
        super.didLanguageChanged()

        for (key, value) in self.ic_resStateHash(UIButton.ICTitleHashKey) {
            self.setTitle(resGetText(value), for: UIControlState(rawValue: key))
        }
    }
}

extension UILabel {
    
    private static let ICTextColorResKey = "ICTextColorResKey"
    private static let ICTextResKey = "ICTextResKey"

    //-------------- text color -----------------
    public func setTextColor(forICResName key:String) {
        self.ic_setResValue(key, forKey: UILabel.ICTextColorResKey)
        self.textColor = resGetColor(key)
    }

    //-------------- text -----------------
    public func setText(forICResName key:String) {
        self.ic_setResValue(key, forKey: UILabel.ICTextResKey)
        self.text = resGetText(key)
    }

    override func didThemeChanged() {
        super.didThemeChanged()
        
        if let textColorKey:String = self.ic_resValue(UILabel.ICTextColorResKey) as? String {
            self.textColor = resGetColor(textColorKey)
        }
    }
    
    override func didLanguageChanged() {
        super.didLanguageChanged()
        
        if let key:String = self.ic_resValue(UILabel.ICTextResKey) as? String {
            self.text = resGetText(key)
        }
    }
}

extension UITextField {
    
    private static let ICTextColorResKey = "ICTextColorResKey"
    private static let ICTextResKey = "ICTextResKey"
    
    //-------------- text color -----------------
    public func setTextColor(forICResName key:String) {
        self.ic_setResValue(key, forKey: UITextField.ICTextColorResKey)
        self.textColor = resGetColor(key)
    }
    
    //-------------- text -----------------
    public func setText(forICResName key:String) {
        self.ic_setResValue(key, forKey: UITextField.ICTextResKey)
        self.text = resGetText(key)
    }
    
    override func didThemeChanged() {
        super.didThemeChanged()
        
        if let textColorKey:String = self.ic_resValue(UITextField.ICTextColorResKey) as? String {
            self.textColor = resGetColor(textColorKey)
        }
    }
    
    override func didLanguageChanged() {
        super.didLanguageChanged()
        
        if let key:String = self.ic_resValue(UITextField.ICTextResKey) as? String {
            self.text = resGetText(key)
        }
    }
}

extension UIImageView {
    private static let ICImageResKey = "ICImageResKey"

    //-------------- text -----------------
    public func setImage(forICResName key:String) {
        self.ic_setResValue(key, forKey: UIImageView.ICImageResKey)
        self.image = resGetImage(key)
    }
    
    override func didThemeChanged() {
        super.didThemeChanged()
        
        if let key:String = self.ic_resValue(UIImageView.ICImageResKey) as? String {
            self.image = resGetImage(key)
        }
    }
}