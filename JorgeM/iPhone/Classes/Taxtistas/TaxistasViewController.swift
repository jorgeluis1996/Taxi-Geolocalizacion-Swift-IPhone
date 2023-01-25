//
//  TaxistasViewController.swift
//  JorgeM
//
//  Created by user213342 on 12/3/22.
//

import UIKit
import Alamofire

class TaxistasViewController: UIViewController{

   
    @IBOutlet weak var lblvMovies: UITableView!
    var arrayMovie : [MovieBE] = []
    
    @IBAction func retrocederaPrincipal(_ sender: Any) {
        navigationController?.popViewController(animated: true)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovies()
    }
    
    private func getMovies() {
        MovieBL.getMovies { movies in
            self.arrayMovie = movies.listOfMovies
            self.lblvMovies.reloadData()
        }
    }
    
    
//    private func saveMovie() {
//
//        var movie : MovieBE?
//        movie?.title = "rocky"
//        movie?.sinopsis = "pelicula de pelea..."
//
//        MovieBL.saveMovie(movie: movie!) { movies in
//            print("Se agregó la película")
//        }
//
//    }

}

extension TaxistasViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMovie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "TaxistasTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TaxistasTableViewCell
        cell.loadData(movie: arrayMovie[indexPath.row])
        return cell
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetallesViewController", sender: arrayMovie[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetallesViewController {
            vc.objMovie = sender as? MovieBE 
        }
    }
    
    
    
        
}
    
    
    
    private func getMovies() {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


