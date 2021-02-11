//
//  DataManagement.swift
//  Approximation-de-Pi
//
//  Created by Anthony Peres da Cruz on 29/01/2021.
//

import UIKit

/**
 L'emplacement du fichier data.plist
 
 # Notes: #
 1. Je n'utilise pas le Bundle car il est preferable d'utiliser le dossier Documents afin de stocker des données :
 [https://developer.apple.com/forums/thread/81838]
 [https://stackoverflow.com/questions/42736244/swift-3-cannot-write-data-to-plist-file]
 */
var urlplist: URL {
    let documentDir = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    return documentDir.appendingPathComponent("data.plist")
}


/**
 Fonction qui recupere les données contenues dans le fichier data.plist au format [Clé:Valeur]
 
 - returns: Les données sous format [String:String]
 
 # Example #
 ```
 var data = loadData()
 print(data)
 // ["key1": "value1", "keyé":"value2"...]
 ```
 */
func loadData() -> [String:String] {
    guard let data = try? Data(contentsOf: urlplist),
          let plist = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String:String] else {
        return [:]
    }
    return plist
}


/**
 Fonction qui permet de modifier les données dans le fichier data.plist
 
 - parameter plist: Les nouvelles données.
 
 # Example #
 ```
 var data = ["key1":"value1"]
 writeData(data)
 ```
 */
func writeData(_ plist: Any) {
    guard let plistData = try? PropertyListSerialization.data(fromPropertyList: plist, format: .xml, options: 0) else {
        return
    }
    try? plistData.write(to: urlplist)
}


/**
 Cette fonction permet de mettre a jour les données du fichier data.plist
 
 On utilise la fonction writeData() afin d'écrire dans le fichier
 
 - parameter nombrePoints: Le nombre de points utilisé afin de faire l'approximation de π.
 - parameter approximation: L'approximation de π
 
 # Example #
 ```
 updateData(nombrePoints: 10000, approximation: 3.13125)
 ```
 */
func updateData(nombrePoints: Int, approximation: Double) {
    var data = loadData()
    data.updateValue(String(format: "%.6f", approximation), forKey: String(nombrePoints))
    writeData(data)
}
