//
//  DetailProductEntity.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 09/06/23.
//
import Foundation
/// Elementos para mostrar el detalle del producto.
struct DetailProduct {
    /// Nombre del producto.
    let nameProduct: String?
    /// Precio original del producto.
    let originalPrice: String?
    /// Precio.
    let price: String?
    /// Porcentaje.
    let porcentaje: Double?
    /// Porcentaje final.
    let procentajeFinal: Double?
    /// Porcentaje de descuento del articulo.
    let porcetanjeDiscount: String
    /// Cantidad disponible del articulo.
    let availableQuantity: String?
    /// Cantidad vendida del articulos.
    let availableSould: String?
    /// Categoria del producto.
    let category: String?
    /// Imagen del producto.
    let thumbnail: String?
    
    let isDiscount: Bool?
}
