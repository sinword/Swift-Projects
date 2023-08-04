//
//  TableViewController.swift
//  HW2_List
//
//  Created by 新翌王 on 2023/3/17.
//

import UIKit

class TableViewController: UITableViewController {
    
    var names = ["facebook", "google", "twitter", "firefox", "youtube"]
    var imgs = ["fb_icon", "google_icon", "twitter_icon", "firefox_icon", "youtube_icon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isEditing = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
//        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        cell.imageView?.image = UIImage(named: imgs[indexPath.row])
        return cell
    }
    
    // Set up segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "segue_homeToIntro", sender: cell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ViewController {
            let selectedCell = sender as! UITableViewCell
            vc.recieveStr = selectedCell.textLabel?.text
            vc.recieveImg = selectedCell.imageView?.image
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let tmp1 = names[fromIndexPath.row]
        names.remove(at: fromIndexPath.row)
        names.insert(tmp1, at: to.row)
        let tmp2 = imgs[fromIndexPath.row]
        imgs.remove(at: fromIndexPath.row)
        imgs.insert(tmp2, at: to.row)
        tableView.reloadData()
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            names.remove(at: indexPath.row)
            imgs.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            let tmpName = names[indexPath.row]
            let tmpImg = imgs[indexPath.row]
            names.insert(tmpName, at: indexPath.row)
            imgs.insert(tmpImg, at: indexPath.row)
            tableView.reloadData()
        }    
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if self.tableView.isEditing {
            return tableEditingStyle
        }
        else {
            return .none
        }
    }
    
    var tableEditingState: Bool = false
    var tableEditingStyle: UITableViewCell.EditingStyle = .none
    
    @IBAction func leftButtonAction(_ sender: UIBarButtonItem) {
        if tableEditingStyle != .delete {
            if self.tableView.isEditing {
                // Done
                tableEditingStyle = .none
                self.tableView.isEditing = false
                sender.style = UIBarButtonItem.Style.plain
                sender.title = "Add"
            }
            else {
                // Add new elements
                tableEditingStyle = .insert
                self.tableView.isEditing = true
                sender.style = UIBarButtonItem.Style.done
                sender.title = "Done"
            }
        }
        
    }
    @IBAction func rightButtinAction(_ sender: UIBarButtonItem) {
        if tableEditingStyle != .insert {
            if self.tableView.isEditing {
                // Done
                tableEditingStyle = .none
                self.tableView.isEditing = false
                sender.style = UIBarButtonItem.Style.plain
                sender.title = "Remove"
            }
            else {
                // Remove elements
                tableEditingStyle = .delete
                self.tableView.isEditing = true
                sender.style = UIBarButtonItem.Style.done
                sender.title = "Done"
            }
        }
    }
    
    
    /*
    // Move row in tableView
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let tmpName = names[fromIndexPath.row]
        names.remove(at: fromIndexPath.row)
        names.insert(tmpName, at: to.row)
        let tmpImg = imgs[fromIndexPath.row]
        imgs.remove(at: fromIndexPath.row)
        imgs.insert(tmpImg, at: to.row)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
