//
//  PantallaPrincipalViewController.swift
//  JorgeM
//
//  Created by user213342 on 12/3/22.
//

import UIKit
import GoogleMaps

class PantallaPrincipalViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapView.isMyLocationEnabled = true
        let camara = GMSCameraPosition.camera(withLatitude: -12.093570, longitude: -77.053157, zoom: 5)
        
        self.mapView.camera = camara
//
//        let marKer = GMSMarker()
//        marKer.position = CLLocationCoordinate2D(latitude: -12.093570, longitude: -77.053157)
//
//        marKer.title = "ISIL"
//        marKer.snippet = "San Isidro"
//        marKer.map = self.mapView
        
        
        
       ///
        
        
//        marKer.title = "ISIL"
//        marker.snippet = "Sann Isidro"
//        marker.map = self.mapView
        
        var markers=[GMSMarker]()
        
        let marker1 = GMSMarker()
        marker1.position = CLLocationCoordinate2D(latitude: -12.093570, longitude: -77.053157)
        marker1.title = "alfredo"
        marker1.snippet = "a 5 min"
        let image2 = UIImage(named: "carx2")
        marker1.icon=image2
        
        let marker2 = GMSMarker()
        marker2.position = CLLocationCoordinate2D(latitude: -12.085020125530553, longitude: -76.97933372918271)
        marker2.title = "juaquin"
        marker2.snippet = "a 3 min"
        let image = UIImage(named: "carx2")
        marker2.icon=image
        
        let marker3 = GMSMarker()
        marker3.position = CLLocationCoordinate2D(latitude: -12.055373730810068, longitude: -77.0542857952119)
        marker3.title = "jorge"
        marker3.snippet = "a 6 min"
        let image3 = UIImage(named: "carx2")
        marker3.icon=image3
        
        
        
        let marker4 = GMSMarker()
        marker4.position = CLLocationCoordinate2D(latitude: -12.023695914321975, longitude: -77.00624788057034)
        marker4.title = "roberto"
        marker4.snippet = "a 50 min"
        let image4 = UIImage(named: "carx2")
        marker4.icon=image4
        
        
        let marker5 = GMSMarker()
        marker5.position = CLLocationCoordinate2D(latitude: -12.041180104616812, longitude: -76.96305170691036)
        marker5.title = "felicya"
        marker5.snippet = "a 40 min"
        let image5 = UIImage(named: "carx2")
        marker5	.icon=image5
        
//
//        let marker3 = GMSMarker()
//        marker1.position = CLLocationCoordinate2D(latitude: -13.078450561247362, longitude: -79.04177050195166)
//        marker1.title = "rESTAURAN"
//        marker1.snippet = "SSSSS"
        
        markers.append(marker1)
        markers.append(marker2)
        markers.append(marker3)
        markers.append(marker4)
        markers.append(marker5)
//        markers.append(marker3)
        
        addMarkers(markers)
        
    }
    func addMarker(position : CLLocationCoordinate2D, title : String, snippet : String){
        
        let market = GMSMarker()
        market.position = position
        market.title = title
        market.snippet = snippet
        market.map = self.mapView
    }
    
    
    func addMarkers (_ Markers : [GMSMarker]){
        for marker in Markers {
            marker.map = self.mapView
        }
    }

}
