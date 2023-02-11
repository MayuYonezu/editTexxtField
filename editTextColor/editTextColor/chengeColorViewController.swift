//
//  chengeColorViewController.swift
//  editTextColor
//
//  Created by Mayu Yonezu on 2023/02/11.
//

import UIKit

class chengeColorViewController: UIViewController {
    
    @IBOutlet weak var testLabel: UILabel!
    var saveData: UserDefaults = UserDefaults.standard
    var testColor: [Data] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        print(testColor)
        let colorData: Data = UserDefaults.standard.data(forKey: "color")!
        let color: UIColor = try! NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colorData)!
        print(color)
        testLabel.textColor = color
        self.navigationController!.navigationBar.tintColor = color
    }

}
