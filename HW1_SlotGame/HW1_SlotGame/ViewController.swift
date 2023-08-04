//
//  ViewController.swift
//  HW1_SlotGame
//
//  Created by 新翌王 on 2023/3/3.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var fruitSlot: UIPickerView!
    @IBOutlet weak var helloUser: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    
    let symbol = ["🍎", "🍐", "🍋", "🍇", "🫐", "🍒"]
    var score = 0
    var col1 = [String]()
    var col2 = [String]()
    var col3 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for _ in 1...100 {
            col1.append(symbol[(Int)(arc4random() % 6)])
            col2.append(symbol[(Int)(arc4random() % 6)])
            col3.append(symbol[(Int)(arc4random() % 6)])
        }
        scoreLabel.text = "Score: 0"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return col1.count
        }
        else if component == 1 {
            return col2.count
        }
        else {
            return col3.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return col1[row]
        }
        else if (component == 1) {
            return col2[row]
        }
        else {
            return col3[row]
        }
    }
    
    // PickerView size setting
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    @IBAction func redButtinClicked(_ sender: UIButton) {
        fruitSlot.selectRow(Int(arc4random()) % 100, inComponent: 0, animated: true)
        fruitSlot.selectRow(Int(arc4random()) % 100, inComponent: 1, animated: true)
        fruitSlot.selectRow(Int(arc4random()) % 100, inComponent: 2, animated: true)
        
        let bingoAlert = UIAlertController(title: "㊗️BINGO㊗️", message: "LETS GOOOOO!!!!", preferredStyle: .alert)
        let bingoAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        bingoAlert.addAction(bingoAction)
        
        if (col1[fruitSlot.selectedRow(inComponent: 0)] == col2[fruitSlot.selectedRow(inComponent: 1)] && col2[fruitSlot.selectedRow(inComponent: 1)] == col3[fruitSlot.selectedRow(inComponent: 2)]) {
            score += 100
            print("BINGOOO!!")
            present(bingoAlert, animated: true)
        }
        scoreLabel.text = "Score: \(score)"
    }

    
    
    override func viewDidAppear(_ animated: Bool) {
        func login() {
            var username: String? = nil
            var password: String? = nil
            
            let loginAlert = UIAlertController(
                title: "Login",
                message: "Please enter username and password",
                preferredStyle: .alert)
            
            loginAlert.addTextField { textField in
                textField.placeholder = "Username"
            }
            
            loginAlert.addTextField { textField in
                textField.placeholder = "Password"
                textField.isSecureTextEntry = true
            }
            
            let notifyAlert = UIAlertController(
                title: nil,
                message: "Please login before playing",
                preferredStyle: .alert)
            
            let notifyAction = UIAlertAction(title: "OK", style: .default, handler: {(action) in
                self.present(loginAlert, animated: true, completion: nil)
            })
            
            notifyAlert.addAction(notifyAction)

            let loginAction = UIAlertAction(title: "Login", style: .default) { (action) in
                username = loginAlert.textFields?[0].text
                password = loginAlert.textFields?[1].text
                print("Username: \(username!)")
                print("Password: \(password!)")
                if (username == "" || password == "") {
                    // notify user of entering
                    self.present(notifyAlert, animated: true, completion: nil)
                }
                else {
                    // continue
                    self.helloUser.text = "Hello, \(username!)"
                }
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                // self.dismiss(animated: true)
            }
            
            loginAlert.addAction(loginAction)
            loginAlert.addAction(cancelAction)
            // self.present(alert, animated: true, completion: nil)
            present(loginAlert, animated: true, completion: nil)
            
        }
        
        func alertFunc() {
            
        }
        
        login()
        
    }

}

