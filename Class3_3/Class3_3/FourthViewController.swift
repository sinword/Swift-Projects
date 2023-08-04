//
//  FourthViewController.swift
//  Class3_3
//
//  Created by 新翌王 on 2023/3/9.
//

import UIKit

class FourthViewController: UIViewController {

    @IBAction func Back(_ sender: UIButton) {
        guard(self.navigationController?.popViewController(animated: true)) != nil else {
            print("NO Navigation Controller")
            return
        }
    }
    
    @IBAction func toNext(_ sender: UIButton) {
        guard(self.navigationController?.popToRootViewController(animated: true)) != nil else {
            print("NO Navigation Controller")
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
