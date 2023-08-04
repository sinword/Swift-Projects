//
//  ViewController.swift
//  HW2_List
//
//  Created by 新翌王 on 2023/3/18.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var introImg: UIImageView!
    var recieveStr: String?
    var recieveImg: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introLabel.text = "Application: \(recieveStr!)"
        introImg.image = recieveImg!
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
