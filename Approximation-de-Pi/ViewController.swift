//
//  ViewController.swift
//  Approximation-de-Pi
//
//  Created by Anthony Peres da Cruz on 21/12/2020.
//

import UIKit

// CONTROLLEUR
class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelPi: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var monteCarloGraph: MonteCarloGraph!
    @IBOutlet weak var meilleureApproximation: UILabel!
    @IBOutlet weak var meilleurApproNbPoints: UILabel!
    
    /// Model
    var monteCarlo = MonteCarlo()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // On initialise les variables du modele
        monteCarlo.nombrePoints = Int(slider.value) * 1000
        monteCarlo.taille_rect = Int(monteCarloGraph.bounds.size.width)
        
        // On affiche l'approximation #1
        refreshLabelApproximation()
    }
    
    
    @IBAction func slider(_ sender: UISlider) {
        let value = Int(sender.value)
        label.text = String(value * 1000)
        monteCarlo.nombrePoints = value * 1000
    }
    
    
    @IBAction func resetMeilleureApproximation(_ sender: Any) {
        monteCarlo.resetBestApproximation()
        refreshLabelApproximation()
    }
    
    
    @IBAction func calcul(_ sender: Any) {
        monteCarloGraph.points = monteCarlo.createPoints()
        monteCarlo.updateApproximations()
        refreshLabelApproximation()
        labelPi.text = String(format: "%.6f", monteCarlo.pi)
    }
    
    
    func refreshLabelApproximation() {
        let defaults = UserDefaults.standard
        meilleureApproximation.text = String(defaults.double(forKey: "approximation"))
        meilleurApproNbPoints.text = String(defaults.integer(forKey: "nbPoints"))
    }
}
