//
//  CiudadesViewController.swift
//  JorgeM
//
//  Created by user213342 on 12/3/22.
//

import UIKit

class CiudadesViewController: UIViewController, UITextViewDelegate {
    var arrayName: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayName.append("Av.luis miguel - Javier Prado")
        arrayName.append("Santa Cruz - 06635  Peru,")
        arrayName.append("San Juan - Puno 21375, Peru")
        arrayName.append("Chachapoyas -01310, Peru")
        arrayName.append("Yaname - Lima 15360  Peru,")
        arrayName.append("Hualgayoc - 06115, Peru")
        arrayName.append("Lachaqui - Lima 15345, Peru")
        arrayName.append("Castrovirreyna - 09740, Peru")
        arrayName.append("Huanuco - 10100, Peru")
        arrayName.append("Lauricocha - 10640, Peru")
        arrayName.append("Castrovirreyna  - 09730, Peru")
        arrayName.append("Mariscal Nieto - 18000, Peru")
        arrayName.append("Sanchez Cerro - 18520, Peru")
        arrayName.append("Tayabamba - La Libertad Peru")
        arrayName.append("Cairani - Tacna, Peru")
        arrayName.append("Ilabaya - Tacna , Peru")
        arrayName.append("Caylloma  Arequipa - Peru")
        arrayName.append("Juli, Chucuito - Puno Peru")
        arrayName.append("Cotabambas - Apurimac Peru")

        // Do any additional setup after loading the view.
    }
    
    @IBAction func atrass(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
//    @IBAction func confirmar(_ sender: Any) {
//        dismiss(animated: true, completion: nil)
//    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CiudadesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayName.count
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CiudadesTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CiudadesTableViewCell
        cell.loadData(name: arrayName [indexPath.row])
        return cell
        
    }
    
    
}
