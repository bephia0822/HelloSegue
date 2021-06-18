//
//  ViewController.swift
//  HelloSegue
//
//  Created by Sophia Wang on 2021/3/27.
//

import UIKit

class ViewController: UIViewController, PinkViewControllerDelegate {
    func setColor(colorType: String) {
        if colorType == "red"{
            view.backgroundColor = .red
        }else if colorType == "green"{
            view.backgroundColor = .green
        }else if colorType == "blue"{
            view.backgroundColor = .blue
        }
    }
    

    @IBOutlet weak var myTextInput: UITextField!
    
    @IBAction func changeView(_ sender: UIButton) {
        if let inputText = myTextInput.text{
            if inputText == ""{
                //no input, pop up an alert
                let myAlert = UIAlertController(title: "No input", message: "Please enter something", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)  //加入按鈕
                myAlert.addAction(okAction)
                present(myAlert, animated: true, completion: nil)   //推出
            }else{
                //有輸入的話
                performSegue(withIdentifier: "gotoview2", sender: inputText)    //去下一頁，並把文字貼上
                myTextInput.text = ""    //同時清空輸入匡文字
                myTextInput.resignFirstResponder()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoview2"{
            if let pink = segue.destination as? PinkViewController{
                pink.infoFromViewOne = sender as? String
                pink.delegate = self
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

