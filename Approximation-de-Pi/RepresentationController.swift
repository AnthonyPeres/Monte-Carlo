//
//  RepresentationController.swift
//  Approximation-de-Pi
//
//  Created by Anthony Peres da Cruz on 11/02/2021.
//

import UIKit

class RepresentationController: UIViewController {
        
    @IBOutlet weak var monteCarloGraph: MonteCarloGraph!
    
    @IBOutlet weak var label_point: UILabel!
    @IBOutlet weak var label_pi: UILabel!
    
    var point = ""
    var pi = ""
    var liste_points = [Point]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label_point.text = point
        label_pi.text = pi
        
        var points = [Point]()
        let t_fenetre = 300
        
        for _ in 0...Int(point)! {
            
            let x = Int.random(in: 0...t_fenetre)
            let y = Int.random(in: 0...t_fenetre)
            
            if x * x + y * y < t_fenetre * t_fenetre {
                points.append(Point(x: x, y: y, inCircle: true))
            } else {
                points.append(Point(x: x, y: y, inCircle: false))
            }
        }
        
        monteCarloGraph.points = points
    }
    
    
    // Envoyé au contrôleur de vue lorsque l'application reçoit un avertissement de mémoire.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
