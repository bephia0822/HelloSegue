//
//  PinkViewController.swift
//  HelloSegue
//
//  Created by Sophia Wang on 2021/3/27.
//

import UIKit

protocol PinkViewControllerDelegate {
    func setColor(colorType: String)
}

class PinkViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var infoFromViewOne: String?
    var delegate: PinkViewControllerDelegate?
    let colorArray = ["red","green","blue"]
    

    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myPickerView: UIPickerView!
    @IBAction func backToViewOne(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        let colorNumber = myPickerView.selectedRow(inComponent: 0)
        let color = colorArray[colorNumber]
        delegate?.setColor(colorType: color)
        navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabel.text = infoFromViewOne
        myPickerView.dataSource = self
        myPickerView.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colorArray[row]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
