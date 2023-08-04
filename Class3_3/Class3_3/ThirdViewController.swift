//
//  ThirdViewController.swift
//  Class3_3
//
//  Created by 新翌王 on 2023/3/9.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBAction func Back(_ sender: UIButton) {
        guard(self.navigationController?.popViewController(animated: true)) != nil else {
            print("NO Navigation Controller")
            return
        }
    }
    
    @IBAction func toNext(_ sender: UIButton) {
        let myStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = myStoryBoard.instantiateViewController(withIdentifier: "fourthVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "texture.jpg")!)

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
