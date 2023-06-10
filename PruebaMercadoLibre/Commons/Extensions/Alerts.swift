//
//  Alerts.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 09/06/23.
//

import UIKit
extension UIAlertController {
    /// Función que declara un alerta informativa.
    /// - Parameters:
    ///   - viewController: Vista que mostrará la alerta.
    ///   - confirm: Código que ejecutará el caso de aceptar la solicitud.
    ///   - title: Título de la alerta.
    ///   - message: Mensaje de la alerta.
    static func showAlertAccept(_ viewController: UIViewController, actionConfirm confirm: (() -> Void)? = nil, titleLocalizable title: String, messageLocalizable message: String) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: { [weak alert] (_) in
            alert?.dismiss(animated: true, completion: nil)
            confirm?()
        }))
        viewController.present(alert, animated: true, completion: nil)
    }
}
