//
//  MainScreenViewController.swift
//  ColorSetter
//
//  Created by Konstantin Kirillov on 28.07.2022.
//

import UIKit

protocol SettingViewControllerDelegate {
    func setScreenColor(redValue: Float, greenValue: Float, blueValue: Float)
}

class MainScreenViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        guard let bacgCol = view.backgroundColor else { return }

        settingsVC.screenColor = bacgCol
        settingsVC.delegate = self
    }
    

}

extension MainScreenViewController:  SettingViewControllerDelegate {
    func setScreenColor(redValue: Float, greenValue: Float, blueValue: Float) {
        view.backgroundColor = UIColor(
            red: CGFloat(redValue),
            green: CGFloat(greenValue),
            blue: CGFloat(blueValue),
            alpha: 1)
    }
}
