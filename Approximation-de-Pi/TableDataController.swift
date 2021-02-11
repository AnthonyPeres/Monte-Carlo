//
//  TableDataController.swift
//  Approximation-de-Pi
//
//  Created by Anthony Peres da Cruz on 28/01/2021.
//

import UIKit

class TableDataController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var refreshControl: UIRefreshControl?
    
    @IBAction func resetData(_ sender: Any) {
        writeData([:])
        self.tableView.reloadData()
    }
    
    var label_cell: [String] {
        get {
            var tmp: [String] = []
            let tmp_data: Dictionary = loadData()

            for (nombrePoints, approximation) in tmp_data.sorted(by: <) {
                let row = "π = \(approximation) avec \(nombrePoints) points"
                tmp.append(row)
            }
            return tmp
        }
    }
    
    var points: [String] {
        get {
            var tmp: [String] = []
            let tmp_data: Dictionary = loadData()

            for (nombrePoints, _) in tmp_data.sorted(by: <) {
                let row = "\(nombrePoints)"
                tmp.append(row)
            }
            return tmp
        }
    }
    
    var approximation: [String] {
        get {
            var tmp: [String] = []
            let tmp_data: Dictionary = loadData()

            for (_, approximation) in tmp_data.sorted(by: <) {
                let row = "\(approximation)"
                tmp.append(row)
            }
            return tmp
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Quand la vue apparait on recharge la tableview
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
}


extension TableDataController: UITableViewDelegate, UITableViewDataSource {
    // On suit les protocols de UITableViewDelegate et UITableViewDataSource (voir doc)
    
    /// Demande à la source de données de renvoyer le nombre de sections dans la vue de table.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /// Indique à la source de données de renvoyer le nombre de lignes dans une section donnée d'une vue de table.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return label_cell.count
    }
    
    /// Demande à la source de données d'insérer une cellule à un emplacement particulier de la vue tableau.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CellTableViewCell
        cell?.label.text = label_cell[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let representation = storyboard?.instantiateViewController(withIdentifier: "RepresentationController") as? RepresentationController
        representation?.point = points[indexPath.row]
        representation?.pi = approximation[indexPath.row]
        self.navigationController?.pushViewController(representation!, animated: true)
    }

}
