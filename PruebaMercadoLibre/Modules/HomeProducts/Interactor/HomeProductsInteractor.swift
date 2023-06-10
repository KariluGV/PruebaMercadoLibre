//
//  HomeProductsInteractor.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 06/06/23.
//

import Foundation
/// Clase que contiene las llamadas al servidor y el manejo de las respuestas ya sean exitosas o con error.
class HomeProductsInteractor: HomeProductsInteractorProtocol {
    /// Referencia al presenter.
    var presenter: HomeProductsPresenterOutputProtocol?
    /// Función que obtiene los datos desde el servidor.
    func getProducts() {
        let urlString = "https://api.mercadolibre.com/sites/MLA/search?category=MLA1055"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                NSLog("Conche tu mare, conche tu mare, conche tu mareeeeeee...")
            } else {
                let httpResponse = response as? HTTPURLResponse
                switch httpResponse?.statusCode {
                case 200:
                    if let jData = data {
                        do {
                            let decodeData = try JSONDecoder().decode(ProductDTO.self, from: jData)
                            self.presenter?.bringProducts(products: decodeData.results ?? [])
                        } catch {
                            NSLog("Conche tu mare, conche tu mare, conche tu mareeeeeee...")
                        }
                    }
                default:
                    NSLog("Conche tu mare, conche tu mare, conche tu mareeeeeee...")
                }
            }
        }.resume()
    }
    /// Función que obtiene los datos desde el servidor.
    /// - Parameter product: Url del Producto.
    func searchProducts(product: String) {
        let urlString = "https://api.mercadolibre.com/sites/MLA/search?q=\(product)"
        let url = URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                NSLog("‼️ error service -> 'searchProducts'")
            } else {
                let httpResponse = response as? HTTPURLResponse
                switch httpResponse?.statusCode {
                case 200:
                    if let jData = data {
                        do {
                            let decodeData = try JSONDecoder().decode(ProductDTO.self, from: jData)
                            self.presenter?.bringProducts(products: decodeData.results ?? [])
                        } catch {
                            NSLog("‼️ error decode data service -> 'searchProducts'")
                        }
                    }
                default:
                    NSLog("‼️ error request service, code: \(String(describing: httpResponse?.statusCode.description)) -> 'searchProducts'")
                }
            }
        }.resume()
    }
}
