//
//  principal.swift
//  Catalogador
//
//  Created by Diego Bergondo Cañas on 22/11/2019.
//  Copyright © 2019 Diego Bergondo Cañas. All rights reserved.
//

import UIKit

class principal: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var vistaPrincipal: UIView!
    var listaMenu: [String] = ["Tipo de colección", "Datos del artículo", "Datos artículo", "Datos CV", "Buscador", "Comparador"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celID: String = "CeldaMenu"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: celID)!
        myCell.textLabel?.text = listaMenu[indexPath.row]
        return myCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "CATALOGADOR"
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let titulo = view as! UITableViewHeaderFooterView
        if let textTitulo = titulo.textLabel {
            textTitulo.font = textTitulo.font.withSize(25)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabla.delegate = self
        self.tabla.dataSource = self
                        
    }
    
}
