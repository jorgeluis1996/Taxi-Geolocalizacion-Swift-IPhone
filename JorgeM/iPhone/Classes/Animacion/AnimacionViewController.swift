//
//  AnimacionViewController.swift
//  JorgeM
//
//  Created by user213342 on 12/5/22.
//

import UIKit

class AnimacionViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.animateState = !self.animateState
        self.animateObject()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var imgLogo: UIImageView!
     var animateState = false
    
    @IBAction func ActionAnimate(_ sender: Any) {
        navigationController?.popViewController(animated: true)

        
    }
    private func animateObject(){
        var transform=CGAffineTransform()
        
        UIView.animate(withDuration:  2 ,delay: 1,options: [.repeat]) {
            if self.animateState == true {
            transform = CGAffineTransform(scaleX: 1, y: 1)
//            transform = transform.concatenating(CGAffineTransform(translationX: 0, y: 200))
                transform = transform.concatenating(CGAffineTransform(rotationAngle: 6.1))
               
                transform = transform.concatenating(CGAffineTransform(rotationAngle: 1))
                

                
                
                self.imgLogo.transform = transform
                
            } else {
                transform = transform.concatenating(CGAffineTransform(rotationAngle: .pi))
                self.imgLogo.transform = .identity
            }
        }
    completion: { _ in
//            UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear) {
//                targetView.transform = CGAffineTransformRotate(targetView.transform, CGFloat(M_PI))
//            } completion: { finite in
//                self.rotateView(targetView: targetView, duration: duration)
//            }

            UIView.animate(withDuration: 0.5) {
                if self.animateState == true {
//                    transform = transform.concatenating(CGAffineTransform(translationX: 0, y: 200))
                    
                    self.imgLogo.transform = transform
                }else{
                    self.imgLogo.transform = .identity
                }
            }
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
