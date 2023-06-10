//
//  UIImageView+Utils.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 06/06/23.
//

import UIKit
/// Extensión para modificar style de UIImageView.
extension UIImageView {
    /// Función que convierte un URL a la imagen que regresa el servicio.
    /// - Parameter url: String de la url.
    func loadURLImage(url: String, completion: @escaping() -> Void) {
        guard let url = URL(string: url) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.image = image
                completion()
            }
        }
        task.resume()
    }
}
