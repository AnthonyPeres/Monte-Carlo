//
//  MonteCarloGraph.swift
//  Approximation-de-Pi
//
//  Created by Anthony Peres da Cruz on 22/12/2020.
//

import UIKit

// VUE
@IBDesignable
class MonteCarloGraph: UIView {
    
    @IBInspectable
    var color: UIColor = UIColor.red
    var points = [Point]() { didSet { setNeedsDisplay() }}
    
    func pathForPoint(point: Point) -> UIBezierPath {
        let path = UIBezierPath(rect: CGRect(x: point.x, y: point.y, width: 1, height: 1))
        return path
    }
    
    override func draw(_ rect: CGRect) {
        for point in points {
            
            if point.inCircle {
                color = UIColor.green
            } else {
                color = UIColor.red
            }
            
            color.set()
            pathForPoint(point: point).stroke()
        }
    }
}
