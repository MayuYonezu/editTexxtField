//
//  ViewController.swift
//  editTextColor
//
//  Created by Mayu Yonezu on 2023/02/11.
//

import UIKit

class ViewController: UIViewController {
    
    var saveData: UserDefaults = UserDefaults.standard
    
    @IBOutlet weak var chengeColorButton: UIButton!
    @IBOutlet weak var nextViewButton: UIButton!
    @IBOutlet weak var chengeColorImageView: UIImageView!
    @IBOutlet weak var testLabel: UILabel!
    
    var colorPicker = UIColorPickerViewController()
    var selectedColor = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let colorData: Data = UserDefaults.standard.data(forKey: "color")!
        let color: UIColor = try! NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData)!
        print(color)
        testLabel.textColor = color
        chengeColorButton.tintColor = color
        nextViewButton.tintColor = color
        chengeColorImageView.backgroundColor = color
    }
    
    @IBAction func changeColor() {
        colorPicker.delegate = self
        appearColorPicker()
    }
    
    func appearColorPicker() {
        colorPicker.supportsAlpha = true
        colorPicker.selectedColor = selectedColor
        present(colorPicker, animated: true)
    }
}

extension ViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        selectedColor = viewController.selectedColor
        chengeColorImageView.backgroundColor = selectedColor
        chengeColorButton.tintColor = selectedColor
        nextViewButton.tintColor = selectedColor
        testLabel.textColor = selectedColor
        let color: UIColor = selectedColor
        let colorData: Data = try! NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: UIColor.supportsSecureCoding)
        saveData.set(colorData, forKey: "color")
        saveData.set("a", forKey: "text")
        print(colorData)
        
        print("選択した色: \(selectedColor)")
    }
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        print("dismissed colorPicker")
    }
}
