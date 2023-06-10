//
//  HomeProductsEntity.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 06/06/23.
//
import Foundation
// MARK: - ProductDTO
struct ProductDTO: Codable {
    let results: [Result]?
}

// MARK: - Result
struct Result: Codable {
    /// Id del producto.
    let id: String?
    /// Id del producto.
    let title: String?
    /// Categoria.
    let domainID: String?
    /// Imagen del producto.
    let thumbnail: String?
    /// Precio final.
    let price: Double?
    /// Precio original.
    let originalPrice: Int?
    /// Cantidad vendida.
    let soldQuantity: Int?
    /// Cantidad disponible.
    let availableQuantity: Int?

    enum CodingKeys: String, CodingKey {
        case id, title
        case domainID = "domain_id"
        case thumbnail
        case price
        case originalPrice = "original_price"
        case soldQuantity = "sold_quantity"
        case availableQuantity = "available_quantity"
    }
}
