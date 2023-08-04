//
//  ViewController.swift
//  Class3_3
//
//  Created by 新翌王 on 2023/3/9.
//

import UIKit

class ViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()
    func createGradientLayer() {
        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.blue.cgColor]
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createGradientLayer()
    }
    
    @IBAction func toSecond(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "secondVC") {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func toThird(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "thirdVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "First view"
        // Do any additional setup after loading the view.
    }
}

