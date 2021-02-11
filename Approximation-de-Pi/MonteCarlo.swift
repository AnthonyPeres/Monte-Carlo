//
//  MonteCarlo.swift
//  Approximation-de-Pi
//
//  Created by Anthony Peres da Cruz on 28/01/2021.
//

import Foundation

// MODELE
class MonteCarlo {
    
    var taille_rect: Int = 0
    var nombrePoints = 0
    var nombrePointsDedans = 0
    
    var pi: Double {
        get {
            return 4 * Double(nombrePointsDedans) / Double(nombrePoints)
        }
    }
    
    func createPoints() -> [Point] {
        var points = [Point]()
        nombrePointsDedans = 0
        
        for _ in 0...nombrePoints {
            let x = Int.random(in: 0...taille_rect)
            let y = Int.random(in: 0...taille_rect)
            var inCircle = Bool()
            
            if x * x + y * y <= taille_rect * taille_rect {
                inCircle = true
                self.nombrePointsDedans += 1
            } else {
                inCircle = false
            }
            
            points.append(Point(x: x, y: y, inCircle: inCircle))
        }
        
        return points
    }
    
    
    private let defaults = UserDefaults.standard
    
    // Mise a jour des approximations
    func updateApproximations() {
        
        // Approximation #1
        let approximation = defaults.double(forKey: "approximation")
        if approximation == 0.0 || abs(Double.pi.distance(to: approximation)) > abs(Double.pi.distance(to: pi)) {
            defaults.setValue(String(format:"%.6f", pi), forKey: "approximation")
            defaults.setValue(String(nombrePoints), forKey: "nbPoints")
        }
        
        // Liste des approximations
        let key: String = String(nombrePoints)
        if loadData()[key] != nil {
            if let score = Double(loadData()[key]!) {
                if abs(Double.pi.distance(to: pi)) >= abs(Double.pi.distance(to: score)) {
                    return
                }
            }
        }
        updateData(nombrePoints: nombrePoints, approximation: pi)
    }
    
    // Remise a zero de l'approximation #1
    func resetBestApproximation() {
        defaults.setValue(String(0), forKey: "approximation")
        defaults.setValue(String(0), forKey: "nbPoints")
    }
}
