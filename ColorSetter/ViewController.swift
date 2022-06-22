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
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        
        valueRedLabel.text = String(format: "%.2f", redSlider.value)
        valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
        valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
        
        getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
    }
    
    @IBAction func changeColorSettings(_ sender: UISlider) {
        
        switch sender.tag {
        case 1:
            valueRedLabel.text = String(format: "%.2f", redSlider.value)
            getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
        case 2:
            valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
            getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
        case 3:
            valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
            getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
        default:
            getColoFrom(redColor: redSlider.value, greenColor: greenSlider.value, blueColor: blueSlider.value)
        }
        
    }
    
    
    private func getColoFrom(redColor red: Float, greenColor green: Float, blueColor blue: Float) {
        mainView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1)
    }

}

