//
//  ViewController.swift
//  Tarea_Angoma
//
//  Created by Arian Angoma on 15/04/19.
//  Copyright © 2019 angomaVilchez. All rights reserved.
//

import UIKit

class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var notas:[Nota] = []
    
    //var indexSeleccionado = 0
    
    var nota : Nota? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //notas = crearNotas()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCurso()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let nota = notas[indexPath.row]
        
        if nota.promedio >= 13 {
            cell.backgroundColor = UIColor.green
            cell.textLabel?.text = (nota.curso!) + ": \(nota.promedio)"
        } else {
            cell.backgroundColor = UIColor.yellow
            cell.textLabel?.text = (nota.curso!) + ": \(nota.promedio)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //indexSeleccionado = indexPath.row
        let nota = notas[indexPath.row]
        performSegue(withIdentifier: "cursoSeleccionadaSegue", sender: nota)
    }
    
    
    
    /**func crearNotas() -> [Nota] {
        
        let nota1 = Nota()
        nota1.curso = "Base de Datos"
        nota1.promedioPractica = 16
        nota1.promedioLaboratorio = 19
        nota1.examenFinal = 15
        nota1.promedio = round((nota1.promedioLaboratorio + nota1.promedioPractica + nota1.examenFinal) / 3);
        
        let nota2 = Nota()
        nota2.curso = "Desarrollo Web Avanzado"
        nota2.promedioPractica = 11
        nota2.promedioLaboratorio = 13
        nota2.examenFinal = 10
        nota2.promedio = round((nota2.promedioLaboratorio + nota2.promedioPractica + nota2.examenFinal) / 3);
        
        let nota3 = Nota()
        nota3.curso = "Amazon Web Services"
        nota3.promedioPractica = 15
        nota3.promedioLaboratorio = 17
        nota3.examenFinal = 05
        nota3.promedio = round((nota3.promedioLaboratorio + nota3.promedioPractica + nota3.examenFinal) / 3);
        
        let nota4 = Nota()
        nota4.curso = "Desarrollo de Aplicativos"
        nota4.promedioPractica = 13
        nota4.promedioLaboratorio = 14
        nota4.examenFinal = 15
        nota4.promedio = round((nota4.promedioLaboratorio + nota4.promedioPractica + nota4.examenFinal) / 3);
        
        return [nota1, nota2, nota3, nota4]
    }**/
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let nota = notas[indexPath.row]
        
        if editingStyle == .delete {
        
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(nota)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            obtenerCurso()
            tableView.reloadData()
            
        }
    }
    
    
    @IBAction func agregarCurso(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerCurso() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            notas = try context.fetch(Nota.fetchRequest()) as! [Nota]
        } catch {
            print("HA OCURRIDO UN ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "cursoSeleccionadaSegue" {
            let siguienteVC = segue.destination as! CursoCompletadaViewController
            siguienteVC.nota = sender as! Nota
            //siguienteVC.anteriorVC = self
        }
    }
}

