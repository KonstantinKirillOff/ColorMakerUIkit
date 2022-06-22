//
//  ViewController.swift
//  ColorSetter
//
//  Created by Konstantin Kirillov on 22.06.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var valueRedLabel: UILabel!
    @IBOutlet weak var valueGreenLabel: UILabel!
    @IBOutlet weak var valueBlueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        
        setValue(for: valueRedLabel, valueBlueLabel, valueGreenLabel)
        getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
    }
    
    @IBAction func changeColorSettings(_ sender: UISlider) {
        
        switch sender {
        case redSlider:
            setValue(for: valueRedLabel)
        case greenSlider:
            setValue(for: valueGreenLabel)
        default:
            setValue(for: valueBlueLabel)
        }
        
        getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
    }
    
    private func setValue(for labels: UILabel...) {
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
    
    private func getColoFrom(redColor red: Float, greenColor green: Float, blueColor blue: Float) {
        mainView.backgroundColor = UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: 1)
    }

}

