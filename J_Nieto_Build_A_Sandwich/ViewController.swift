//
//  ViewController.swift
//  J_Nieto_Build_A_Sandwich
//
//  Created by X on 5/21/20.
//  Copyright © 2020 X. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pickerDictArrayData = [String:[String]]()    // Dictionary of Strings and Arrays of Int
    var pickerData: [[String]] = [[String]]()
    
    @IBOutlet weak var pLabel: UILabel!
    @IBOutlet weak var vLabel: UILabel!
    @IBOutlet weak var bLabel: UILabel!
    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var makeSandwich: UIButton!
    @IBOutlet weak var imgViewComplete: UIImageView!
    @IBAction func makeSandwichBtn(_ sender: Any) {
        pLabel.text = ""
        vLabel.text = ""
        bLabel.text = ""
        sLabel.text = ""
        imgViewComplete.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Connect data to UIPicker :
                imgViewComplete.isHidden = true
       self.pickerView.delegate = self
       self.pickerView.dataSource = self
        
        /* Input the data into the multi-dimsensional array. The index is "pickerData[component][row] with the [component][row] indentifying each individual array within the array and the [row index] identifying the data with the associated array*/
        pickerData = [["Protein","turkey","ham", "salmon","tuna"],
        ["Veggies","lettuce", "tomato", "mushrooms","onions"],
        ["Bread","wheat", "ruben", "bagel","baget","wrap"],
        ["Spread","mayo", "mustard", "balsamic", "vinaigrette"]]
        // Tried to use a dictionary but did not know how to implement
        pickerDictArrayData = ["Protein":["turkey","ham", "salmon","tuna"],
                       "Veggies": ["lettuce", "tomato", "mushrooms","onions"],
                       "Bread": ["wheat", "white", "bagel","baget"],
                       "Spread": ["mayo", "mustard", "balsamic", "vinaigrette"]]
    }
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    //Returns the # of components(arrays) within the multi-array
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    //Returns the number of rows(data) within each component(array)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    //Returns the data(string) from within the array via each [component][row] index & pops the Picker Wheel
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let  proteinVeggBread = component
        
        switch proteinVeggBread {
        case 0: //Protein selections will be assigned to pLable
            //pLabel.textColor = UIColor.blue
            pLabel.text = pickerData[component][row]
            print("Protein selections")
        case 1: //Veggi selections will be assigned to vLable
            vLabel.text = pickerData[component][row]
            print("Veggie selections")
        case 2: //Bread selections will be assigned to bLable
            bLabel.text = pickerData[component][row]
            print("Bread selections")
        default:
            sLabel.text = pickerData[component][row]
            print("Spread was included")
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return pickerDictArrayData["Protein"]![row]
        //return pickerDictArrayData[component][row]
        return pickerData[component][row]
    }
}
