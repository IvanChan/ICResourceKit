//
//  ViewController.swift
//  ICResourceKit
//
//  Created by IvanChan on 01/25/2018.
//  Copyright (c) 2018 IvanChan. All rights reserved.
//

import UIKit
import ICFoundation
import ICResourceKit

class ViewController: UIViewController {

    @IBOutlet var themeSegmentedControl:UISegmentedControl?
    @IBOutlet var regionSegmentedControl:UISegmentedControl?
    @IBOutlet var languageSegmentedControl:UISegmentedControl?

    @IBOutlet var imageView: UIImageView?
    @IBOutlet var colorView: UIView?

    @IBOutlet var regionButton: UIButton?
    
    @IBOutlet var languageLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup theme first
        ICResEnvironmentConfigurator.shared.relativeResMainPath = "MyResource"
        let _ = ICThemeManager.shared.loadTheme(named: ICPresetTheme.day.rawValue)
        
        // Setup region, or default is your system settings
        ICLocalization.shared.changeRegion(regionCode: "CN")
        ICLocalization.shared.changeLanguage(languageCode: "zh-Hans")

        // Setup display
        self.imageView?.setImage(forICResName: "test.png")
        self.colorView?.setBackgroundColor(forICResName: "testColor")
        
        let image = resGetRegionImage("flag.png")
        self.regionButton?.setImage(image, for: .normal)
        
        self.languageLabel?.setText(forICResName: "TestDisplay")
        
        
        // Setup Observer
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.didReceiveICLocalizationRegionDidChanged), name: .ICLocalizationRegionDidChanged, object: nil)
    }
    
    @objc func didReceiveICLocalizationRegionDidChanged() {
        let image = resGetRegionImage("flag.png")
        self.regionButton?.setImage(image, for: .normal)
    }

    @IBAction func changeTheme() {
        let toTheme:String = self.themeSegmentedControl?.selectedSegmentIndex == 0 ? ICPresetTheme.day.rawValue: ICPresetTheme.night.rawValue
        let _ = ICThemeManager.shared.loadTheme(named:toTheme)
    }
    
    @IBAction func changeRegion() {
        let toRegion:String = self.regionSegmentedControl?.selectedSegmentIndex == 0 ? "CN" : "IN"
        let _ = ICLocalization.shared.changeRegion(regionCode: toRegion)
    }
    
    @IBAction func changeLanguage() {
        let toLan:String = self.languageSegmentedControl?.selectedSegmentIndex == 0 ? "zh" : "en"
        let _ = ICLocalization.shared.changeLanguage(languageCode: toLan)
    }
    
}

