//
//  CursoCompletadaViewController.swift
//  Tarea_Angoma
//
//  Created by Arian Angoma on 22/04/19.
//  Copyright © 2019 angomaVilchez. All rights reserved.
//

import UIKit

class CursoCompletadaViewController: UIViewController {
    
    var nota : Nota? = nil
    
    //var anteriorVC = ViewController()
    
    @IBOutlet weak var cursoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if nota!.promedio >= 13 {
            cursoLabel.backgroundColor = UIColor.green
            cursoLabel.text = (nota!.curso!) + ": \(nota!.promedio)"
        } else {
            cursoLabel.backgroundColor = UIColor.yellow
            cursoLabel.text = (nota!.curso!) + ": \(nota!.promedio)"
        }
    }
    
    @IBAction func eliminarCurso(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(nota!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
}
