//
//  tipoColeccion.swift
//  Catalogador
//
//  Created by Diego Bergondo Cañas on 01/12/2019.
//  Copyright © 2019 Diego Bergondo Cañas. All rights reserved.
//

import UIKit

class tipoColeccion: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet var tipo: UIPickerView!
    var listaTipo: [String] = ["Cuadros", "Libros", "Música", "Videojuegos"]
    var tipoSeleccionado: Int = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listaTipo.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listaTipo[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipoSeleccionado = row
    }
    
    func getTipoSeleccionado() -> Int{
        return tipoSeleccionado
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipo.dataSource = self
        self.tipo.delegate = self
    }

}
