//
//  ViewController.swift
//  Catalogador
//
//  Created by Diego Bergondo Cañas on 22/11/2019.
//  Copyright © 2019 Diego Bergondo Cañas. All rights reserved.
//

import UIKit

class inicio: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var lista: UIPickerView!
    @IBOutlet weak var boton: UIButton!
    var listaPosibilidad: [String] = ["Archivo local", "BBDD SQL"]
    var eleccion: Int = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return listaPosibilidad.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return listaPosibilidad[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.eleccion = row
    }
        
    @IBAction func pulsarBoton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "elegirCategoria") as? elegirCategoria
        vc?.eleccion = eleccion
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lista.dataSource = self
        self.lista.delegate = self
    }

}

