//
//  ViewController.swift
//  ColorSetter
//
//  Created by Konstantin Kirillov on 22.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var valueRedLabel: UILabel!
    @IBOutlet weak var valueGreenLabel: UILabel!
    @IBOutlet weak var valueBlueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    var delegate: SettingViewControllerDelegate!
    var screenColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        blueTextField.delegate = self
        greenTextField.delegate = self
        
        mainView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        getSliderValues(from: screenColor)
        
        setLabelsValues(for: valueRedLabel, valueBlueLabel, valueGreenLabel)
        setTextFieldValues(for: redTextField, blueTextField, greenTextField)
        
        getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
        
    }
    
    @IBAction func changeColorSettings(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            setLabelsValues(for: valueRedLabel)
            setTextFieldValues(for: redTextField)
        case greenSlider:
            setLabelsValues(for: valueGreenLabel)
            setTextFieldValues(for: greenTextField)
        default:
            setLabelsValues(for: valueBlueLabel)
            setTextFieldValues(for: blueTextField)
        }
        
        getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
    }
    
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        delegate.setScreenColor(redValue: redSlider.value, greenValue: greenSlider.value, blueValue: blueSlider.value)
        dismiss(animated: true)
        
    }
    
    private func getSliderValues(from color: UIColor?) {
        guard let gettingColor = color else { return }
        
        redSlider.setValue(Float(gettingColor.ciColor.red), animated: false)
        greenSlider.setValue(Float(gettingColor.ciColor.green), animated: false)
        blueSlider.setValue(Float(gettingColor.ciColor.blue), animated: false)
    }
    
    
    private func setLabelsValues(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case valueRedLabel:
                valueRedLabel.text = String(format: "%.2f", redSlider.value)
            case valueBlueLabel:
                valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
            default:
                valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
            }
        }
    }
    
    private func setTextFieldValues(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = String(format: "%.2f", redSlider.value)
            case blueTextField:
                blueTextField.text = String(format: "%.2f", blueSlider.value)
            default:
                greenTextField.text = String(format: "%.2f", greenSlider.value)
            }
        }
    }
    
    private func getColoFrom(redColor red: Float, greenColor green: Float, blueColor blue: Float) {
        mainView.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1)
    }

}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let floatValue = Float(newValue) else { return }
        
        switch textField {
        case redTextField:
            redSlider.setValue(floatValue, animated: true)
            setLabelsValues(for: valueRedLabel)
        case blueTextField:
            blueSlider.setValue(floatValue, animated: true)
            setLabelsValues(for: valueBlueLabel)
        default:
            greenSlider.setValue(floatValue, animated: true)
            setLabelsValues(for: valueGreenLabel)
        }
        
        getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
    }
}

