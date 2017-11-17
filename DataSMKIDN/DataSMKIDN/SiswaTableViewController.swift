//
//  SiswaTableViewController.swift
//  DataSMKIDN
//
//  Created by Gw on 16/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SiswaTableViewController: UITableViewController {
    var namaSelected:String?
    var emailSelected:String?
    var kelasSelected:String?
    var alamatSelected:String?
    var telpSelected:String?
    var kelaminSelected:String?
    // declare variable for nampung data
    //declare variable to nampung  id has been sent
    var nampungId : String? = nil
    //declare array siswa
    var arraysiswa = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("id + " + nampungId!)
        let params = ["id" : nampungId!]
        let url = "http://localhost/ServerKelas/index.php/DataGuru/getSiswaById"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (response) in
            //check response
            if response.result.isSuccess {
                //if response success we take json
                let json = JSON(response.result.value as Any)
                print(json)
                //get jsonarray from json above
                self.arraysiswa = json["List Kelas"].arrayObject as! [[String : String]]
                //check in log
                //print(self.arrayberita)
                
                //check sum of array
                if(self.arraysiswa.count > 0){
                    
                    //refresh tableview
                    self.tableView.reloadData()
                }
            }
            else{
                
                print("error server")
                
            }
        })
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return arraysiswa.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSiswa", for: indexPath) as! SiswaTableViewCell
        
        var serverid = arraysiswa[indexPath.row]
        
        var id = serverid["id"]
        let nama = serverid["nama"]
        let email = serverid["email"]
        let kelas = serverid["kelas"]
//        let alamat = serverid["alamat"]
//        let no_telp = serverid["no_telp"]
//        let JK = serverid["JK"]
        //print(judul)
//        var gambar = serverid["gambar"]
        
        //move label
        cell.nama.text = nama
        cell.email.text = email
        cell.kelas.text = kelas
        
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = arraysiswa[indexPath.row]
        
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = task["nama"]
        emailSelected = task["email"]
        kelasSelected = task["id"]
        alamatSelected = task["alamat"]
        telpSelected = task["no_telp"]
        kelaminSelected = task["JK"]
        
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak`
        if segue.identifier == "segue"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                let value = arraysiswa[indexPath.row]
                controller.passNama = value["nama"]
                controller.passEmail = value["email"]
                controller.passKelas = value["id"]
                controller.passAlamat = value["alamat"]
                controller.passTelp = value["no_telp"]
                controller.passKelamin = value["JK"]
            }
        }
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
