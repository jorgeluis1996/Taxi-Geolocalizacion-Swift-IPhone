//
//  CiudadesTableViewCell.swift
//  JorgeM
//
//  Created by user213342 on 12/4/22.
//

import UIKit

class CiudadesTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var lblName: UILabel!
    func loadData(name:String){
        self.lblName.text = name
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
