//
//  ViewController.swift
//  DataSMKIDN
//
//  Created by Gw on 16/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var lblKelas: UILabel!
    @IBOutlet weak var Kelamin: UILabel!
    @IBOutlet weak var Telp: UILabel!
    @IBOutlet weak var lblAlamat: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblNama: UILabel!
    
    var passNama:String?
    var passEmail:String?
    var passKelas:String?
    var passAlamat:String?
    var passTelp:String?
    var passKelamin:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblNama.text = "Nama: " + passNama!
        lblEmail.text = "Email: " + passEmail!
        lblKelas.text = "Id: " + passKelas!
        lblAlamat.text = "Alamat: " + passAlamat!
        Telp.text = "No Telp: " + passTelp!
        Kelamin.text = "Jenis Kelamin: " + passKelamin!
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

