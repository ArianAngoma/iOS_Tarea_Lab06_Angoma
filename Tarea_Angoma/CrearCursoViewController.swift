//
//  CrearCursoViewController.swift
//  Tarea_Angoma
//
//  Created by Arian Angoma on 17/04/19.
//  Copyright © 2019 angomaVilchez. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {

    @IBOutlet weak var txtNombreCurso: UITextField!
    
    @IBOutlet weak var numPromedioPractica: UITextField!
    
    @IBOutlet weak var numPromedioLaboratorio: UITextField!
    
    @IBOutlet weak var numExamenFinal: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let nota = Nota(context: context)
        
        nota.curso = txtNombreCurso.text!
        nota.promedioPractica = Double(numPromedioPractica.text!)!
        nota.promedioLaboratorio = Double(numPromedioLaboratorio.text!)!
        nota.examenFinal = Double(numExamenFinal.text!)!
        nota.promedio = round((Double(numPromedioPractica.text!)! + Double(numPromedioLaboratorio.text!)! + Double(numExamenFinal.text!)!) / 3)
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        /**anteriorVC.notas.append(nota)
        anteriorVC.tableView.reloadData()**/
        navigationController!.popViewController(animated: true)
    }
}
