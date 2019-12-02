//
//  elegirCategoria.swift
//  Catalogador
//
//  Created by Diego Bergondo Cañas on 22/11/2019.
//  Copyright © 2019 Diego Bergondo Cañas. All rights reserved.
//

import UIKit

class elegirCategoria: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    @IBOutlet weak var tipo: UIPickerView!
    var eleccion: Int = 0
    var listaTipo: [String] = ["Cuadros", "Libros", "Música", "Videojuegos"]
    var tipoSeleccionado: Int = 0
    
    func setEleccion(eleccion: Int){
        self.eleccion = eleccion
    }
    
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
    
    @IBAction func pulsarAceptar(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "principal") as? principal
        vc?.setTipo(tipo: tipoSeleccionado)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func pulsarCancelar(_ sender: Any) {
        tipo.selectRow(0, inComponent: 0, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipo.dataSource = self
        self.tipo.delegate = self
    }
    
    
}
