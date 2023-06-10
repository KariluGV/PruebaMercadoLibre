//
//  Utils.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 09/06/23.
//
import Foundation
///  Clase de utilerías para el proyecto.
final class Utils: NSObject {
    /**
     Función  que calcula el porcentaje de descuento de los productos.
     - Parameters:
        - priceProduct: Precio del producto.
        - originalPriceProduct: Precio final del producto.
     - Returns: Regresa un valor tipo **Double** que indica el porcentaje del producto.
    */
    static func conversionPercentageFloat(priceProduct: Double, originalPriceProduct: Double) -> Double {
        var totalPorgentage: Double = 0
        totalPorgentage = priceProduct / originalPriceProduct * 100 - 100
        return Double(totalPorgentage)
    }
    /**
     Función  que convierte un entero en un doble.
     - Parameters:
        - value: Valor a convertir.
        - originalPriceProduct: Precio final del producto.
     - Returns: Regresa un valor tipo **Double**..
    */
    static func convertToDouble(_ value: Int) -> Double {
        let doubleValue = Double(value) / 10.0
        return doubleValue
    }
    /**
     Función  que redondea el porcentaje de los productos a "N" cantidad números despues del decimal.
     - Parameters:
        - value: Valor a convertir..
        - decimals: Numero de decimales.
     - Returns: Regresa un valor tipo **Double**.
    */
    static func roundToDecimals(_ value: Double, decimals: Int) -> Double {
        let factor = pow(10.0, Double(decimals))
        let roundedValue = round(value * factor) / factor
        return roundedValue
    }
    /**
     Función  que elimina a la vista del usuario la palabra Optional que regresa el servicio.
     - Parameters:
        - text: Texto a mostrar al usuario.
     - Returns: Regresa un valor tipo **String**.
    */
    static func unwrappedText(_ text: String?) -> String {
        guard let unwrappedText = text else {
            return ""
        }
        return unwrappedText.replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "")
    }
}
