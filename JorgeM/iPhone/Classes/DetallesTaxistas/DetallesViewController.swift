//
//  DetallesViewController.swift
//  JorgeM
//
//  Created by user213342 on 12/3/22.
//

import UIKit
import AlamofireImage

class DetallesViewController: UIViewController {
    
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblPopulary: UILabel!
    @IBOutlet weak var lblVoteAverage: UILabel!
    @IBOutlet weak var lblVoteCount: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    var objMovie : MovieBE?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.getMovieById()
        
        self.lblTitle.text = objMovie?.title
        self.lblPopulary.text = String(objMovie?.popularity ?? 0)
        self.lblVoteCount.text = String(objMovie?.voteCount ?? 0)
        self.lblVoteAverage.text = String(objMovie?.voteAverage ?? 0)
        
        let urlString = "https://image.tmdb.org/t/p/w200" + (objMovie?.image ?? "")
        if let url = URL(string: urlString){
            self.imgMovie?.af.setImage(withURL: url)
        }

        // Do any additional setup after loading the view.
    }
    
    private func getMovieById(){
        MovieBL.getMovieById(movie: objMovie!) { movie in
            self.objMovie = movie
            print(self.objMovie)
            
        }
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
