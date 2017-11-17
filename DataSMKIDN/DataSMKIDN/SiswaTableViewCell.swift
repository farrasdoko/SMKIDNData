//
//  SiswaTableViewCell.swift
//  DataSMKIDN
//
//  Created by Gw on 16/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class SiswaTableViewCell: UITableViewCell {

    @IBOutlet weak var kelas: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var nama: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
