//
//  TaxistasTableViewCell.swift
//  JorgeM
//
//  Created by user213342 on 12/4/22.
//

import UIKit
import AlamofireImage

class TaxistasTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    
    func loadData(movie: MovieBE) {
       self.lblName.text = movie.title
        let urlString = "https://image.tmdb.org/t/p/w200" + movie.image
        if let url = URL(string: urlString) {
            self.imgMovie.af.setImage(withURL: url)
        }
    }
        
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}


//@IBOutlet weak var lblName: UILabel!
//@IBOutlet weak var imgMovie: UIImageView!
//
//func loadData(movie: MovieBE) {
//    self.lblName.text = movie.title
//
//    let urlString = "https://image.tmdb.org/t/p/w200" + movie.image
//    if let url = URL(string: urlString) {
//        self.imgMovie.af.setImage(withURL: url)
//    }
//
//}
//
//}
