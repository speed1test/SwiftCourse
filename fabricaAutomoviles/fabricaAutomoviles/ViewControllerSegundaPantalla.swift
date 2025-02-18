import UIKit

class ViewControllerSegundaPantalla: UIViewController {

    // Conexiones con la interfaz
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var image1: UIImageView!
    
    // Variable para manejar un automóvil
    var automovil: Automovil?

    // Botones de acción
    @IBAction func showInfo(_ sender: Any) {
        if let auto = automovil {
            info.text = "Marca: \(auto.marca), Modelo: \(auto.modelo), Año: \(auto.año)"
        } else {
            info.text = "No hay un automóvil creado. Usa los botones para crear uno."
        }
    }
    
    @IBAction func encender(_ sender: Any) {
        if automovil != nil {
            info.text = "El automóvil \(automovil!.marca) está encendido."
        } else {
            info.text = "Primero crea un automóvil."
        }
    }
    
    @IBAction func apagar(_ sender: Any) {
        if automovil != nil {
            info.text = "El automóvil \(automovil!.marca) está apagado."
        } else {
            info.text = "Primero crea un automóvil."
        }
    }
    
    @IBAction func acelerar(_ sender: Any) {
        if automovil != nil {
            info.text = "El automóvil \(automovil!.marca) está acelerando."
        } else {
            info.text = "Primero crea un automóvil."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let auto = automovil {
            info.text = "Información inicial: Marca: \(auto.marca), Modelo: \(auto.modelo), Año: \(auto.año)"
        } else {
            info.text = "No se recibió un automóvil."
        }
    }
}
