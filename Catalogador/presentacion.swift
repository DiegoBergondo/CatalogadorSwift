//
//  presentacion.swift
//  Catalogador
//
//  Created by Diego Bergondo Cañas on 01/12/2019.
//  Copyright © 2019 Diego Bergondo Cañas. All rights reserved.
//

import UIKit

class presentacion: UIViewController{
    
    @IBOutlet weak var titulo: UITextField!
    @IBOutlet weak var imagen: UIImageView!
    var tipo: Int = 0
    
    func setTipo(tipo: Int){
        self.tipo = tipo
        reload()
    }
    
    func reload(){
        switch tipo {
        case 0:
            titulo.text = "COLECCIÓN DE CUADROS"
            imagen.image = UIImage(named: "coleccion_cuadros")!
        case 1:
            titulo.text = "COLECCIÓN DE LIBROS"
            imagen.image = UIImage(named: "coleccion_libros")!
        case 2:
            titulo.text = "COLECCIÓN DE MÚSICA"
            imagen.image = UIImage(named: "coleccion_musica")!
        default:
            titulo.text = "COLECCIÓN DE VIDEOJUEGOS"
            imagen.image = UIImage(named: "coleccion_videojuegos")!
        }
    }
    
}
