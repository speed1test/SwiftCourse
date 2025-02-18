import UIKit

class ViewController: UIViewController {

    // Variable para manejar un automóvil
    var automovil: Automovil?
    
    @IBAction func crearsencillo(_ sender: Any) {
        automovil = Automovil(marca: "Toyota", modelo: "Corolla", año: 2020)
        print(automovil?.año ?? "No se pudo crear el automóvil")
        abrirPantalla2()
    }
    
    @IBAction func crearmazda(_ sender: Any) {
        automovil = Automovil(marca: "Mazda", modelo: "CX-5", año: 2023)
        print(automovil?.año ?? "No se pudo crear el automóvil")
        abrirPantalla2()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Método para abrir Pantalla2 desde el Storyboard
    func abrirPantalla2() {
        // Instanciar la segunda pantalla usando el Storyboard ID
        guard let pantalla2 = storyboard?.instantiateViewController(withIdentifier: "pantalla2") as? ViewControllerSegundaPantalla else {
            print("Error: No se encontró el Storyboard ID 'pantalla2'")
            return
        }
        
        // Pasar el objeto automovil a la segunda pantalla
        pantalla2.automovil = self.automovil
        
        // Presentar la segunda pantalla
        pantalla2.modalPresentationStyle = .fullScreen // Opcional: Presentar en pantalla completa
        //present(pantalla2, animated: true, completion: nil)
        navigationController?.pushViewController(pantalla2, animated: true)
    }
}
