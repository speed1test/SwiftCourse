//
//  ViewController.swift
//  TableViews
//
//  Created by Brais Moure.
//  Copyright © 2020 MoureDev. All rights reserved.
//

import UIKit

// 1. importar core data
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    // 2. Refencia al managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // 3. Cambiar a cariable de tipo pasi sin datos iniciales
    private var myCountries = [Pais]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 4. Recuperar datos
        
        recuperarDatos()

        tableView.dataSource = self
        tableView.delegate = self

        
    }

    @IBAction func add(_ sender: Any) {
        
        //Crear alerta
        let alert = UIAlertController(title: "Agregar un país", message: "Añade un país nuevo", preferredStyle: .alert)
        
        //Agregamos textField para que el usuario pueda escribir el pais
        alert.addTextField()
        
        //Configurar alerta y boton
        let botonAlert = UIAlertAction(title: "Añadir", style: .default) {
            (action) in
            
        //Recuperar datos de textfield
            let textField = alert.textFields![0]
            
        //Creamos un nuveo pais
            let nuevoPais = Pais(context: self.context)
            nuevoPais.nombre = textField.text
            
        //Añade infromacion (añade block do-try-catch)
            try! self.context.save()
            
        //Refescar informacion en tableView
            self.recuperarDatos()
        }
        
        //Añadir boton y alerta
        alert.addAction(botonAlert)
        present(alert, animated: true)
    }
    
    func recuperarDatos() {
        do {
            self.myCountries = try context.fetch(Pais.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        catch {
            print("Error recuperando datos")
        }
    }
    
}




// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
            if cell == nil {
               
                cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                
            }
        cell!.textLabel?.text = myCountries[indexPath.row].nombre
            return cell!
      
            
       
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(myCountries[indexPath.row])
        
        // 7. Añadir funcionalidad de editar
        
        // Cual pais se editara?
        let paisEditar = self.myCountries[indexPath.row]
        
        //Crear alerta
        let alert = UIAlertController(title: "Editar país", message: "Editar el país ", preferredStyle: .alert)
        alert.addTextField()
        
        //Recuperar el textfield de la alerta y agregarla al textfield
        let textField = alert.textFields![0]
        
        textField.text = paisEditar.nombre
        
        //Crear y configurar boton de alerta
        let botonAlerta = UIAlertAction(title: "Editar", style: .default) {
            (action) in
            
        //Editar pais actual con lo que esta en el textfield
            paisEditar.nombre = textField.text
            
        //Guardar información (Añada do try catch)
            try! self.context.save()
            
        //Refrescar información en table view
            self.recuperarDatos()
        }
        
        //Añadir alerta y boton (presentarlos)
        alert.addAction(botonAlerta) 
        present(alert, animated: true)
        
    }
    
    
 // 6. Añadir funcion swipe para eliminar
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //Crear accion de eliminar
        let accionEliminar = UIContextualAction(style: .destructive, title: "Eliminar") { (action, view, completionHandler) in
            //Cual pais se eliminara?
            let paisEliminar = self.myCountries[indexPath.row]
        
            //Eliminar pais
            self.context.delete(paisEliminar)
            
            //Guardar el cambio de informacion
            try! self.context.save()
            
            //Recargar datos
            self.recuperarDatos()
            
        }
        
        return UISwipeActionsConfiguration(actions: [accionEliminar])
        
    }
    
}

