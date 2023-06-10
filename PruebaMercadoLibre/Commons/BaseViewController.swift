//
//  BaseViewController.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 09/06/23.
//
import UIKit
/// Clase con la base de el comportamiento y funciones necesarias en los **ViewControllers**
class BaseViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    /// Método que muestra una alerta en pantalla.
    /// - Parameters:
    ///   - title: Título de la alerta.
    ///   - message: Mensaje de la alerta.
    func baseShowAlert(title: String, message: String) {
        UIAlertController.showAlertAccept(self, titleLocalizable: title, messageLocalizable: message)
    }
}
