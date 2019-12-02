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
    struct secciones {
        var estaExpandida: Bool
        let secciones: [String]
    }
    var vistaPresentacion: presentacion = presentacion()
    var vistaTipoColeccion: tipoColeccion = tipoColeccion()
    var listaSecciones = [
        secciones(estaExpandida: true, secciones: ["Tipo de colección"]),
        secciones(estaExpandida: true, secciones: ["Datos artículo", "Datos CV"]),
        secciones(estaExpandida: true, secciones: ["Buscador"]),
        secciones(estaExpandida: true, secciones: ["Comparador"])]
    var tipo: Int = 0
    
    func setTipo(tipo: Int){
        self.tipo = tipo
    }
    
    func inicializarVistas() {
        vistaPresentacion = storyboard?.instantiateViewController(withIdentifier: "presentacion") as! presentacion
        vistaActiva = vistaPresentacion
        vistaPresentacion.setTipo(tipo: tipo)
        
        vistaTipoColeccion = storyboard?.instantiateViewController(withIdentifier: "tipoColeccion") as! tipoColeccion
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(!listaSecciones[section].estaExpandida){
            return 0
        }
        return listaSecciones[section].secciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celID: String = "CeldaMenu"
        let myCell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: celID)!
        myCell.textLabel?.text = listaSecciones[indexPath.section].secciones[indexPath.row]
        return myCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        switch section {
        case 0:
            button.setTitle("TIPO", for: .normal)
        case 1:
            button.setTitle("DATOS DEL ARTÍCULO", for: .normal)
        case 2:
            button.setTitle("BUSCADOR", for: .normal)
        default:
            button.setTitle("COMPARADOR", for: .normal)
        }
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .lightGray
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(manejadorExpansion), for: .touchUpInside)
        button.tag = section
        return button
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                vistaActiva = vistaTipoColeccion
            default:
                vistaActiva = vistaPresentacion
            }
        default:
            vistaActiva = vistaPresentacion
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listaSecciones.count
    }
    
    @objc func manejadorExpansion(button: UIButton) {
        let section = button.tag
        var indexPaths = [IndexPath]()
        for row in listaSecciones[section].secciones.indices {
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        let estaExpandida = listaSecciones[section].estaExpandida
        listaSecciones[section].estaExpandida = !estaExpandida
        if estaExpandida {
            tabla.deleteRows(at: indexPaths, with: .fade)
        } else {
            tabla.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    var vistaActiva: UIViewController?{
        didSet {
            eliminarVista(vistaEliminar: oldValue)
            activarVista()
        }
    }
    
    func eliminarVista(vistaEliminar: UIViewController?) {
        if let vE = vistaEliminar {
            vE.willMove(toParent: nil)
            vE.view.removeFromSuperview()
            vE.removeFromParent()
        }
    }
    
    func activarVista() {
        if let aV = vistaActiva {
            aV.view.alpha = 0.0
            UIView.animate(withDuration: 0.5, animations: {
                aV.view.alpha = 1.0
            }, completion: nil)
            addChild(aV)
            aV.view.frame = vistaPrincipal.bounds
            vistaPrincipal.addSubview(aV.view)
            aV.didMove(toParent: self)
        }
    }
        
    @IBAction func pulsarAceptar(_ sender: Any) {
    }
    
    @IBAction func pulsarCancelar(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabla.delegate = self
        self.tabla.dataSource = self
        
        inicializarVistas()
    }
    
}
