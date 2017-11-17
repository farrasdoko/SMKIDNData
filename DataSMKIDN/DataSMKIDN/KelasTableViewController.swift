//
//  KelasTableViewController.swift
//  DataSMKIDN
//
//  Created by Gw on 16/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class KelasTableViewController: UITableViewController {
    var arrKelas = [[String : String]]() //array dictionary
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("http://localhost/ServerKelas/index.php/DataGuru/getKelas").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["List Kelas"].arrayObject {
                    self.arrKelas = resData as! [[String : String]]
                }
                if self.arrKelas.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrKelas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellKelas", for: indexPath) as! KelasTableViewCell

        // Configure the cell...
        var serverid = arrKelas[indexPath.row]
        
        
        var id = serverid["id"]
        let kelas = serverid["kelas"]
        
        //move to label
        cell.kelas.text = kelas
        
        return cell
    }
    
    //move to next layout
    //throwing kategori
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let IdStoryBoard = storyboard?.instantiateViewController(withIdentifier: "Siswa") as! SiswaTableViewController
        
        let id = arrKelas[indexPath.row]["id"]
        //        variable to menampung id that was through
        IdStoryBoard.nampungId = id!
        
        show(IdStoryBoard, sender: self)
        
    }
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
