//
//  String.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 07/06/23.
//
import Foundation
extension String {
    /**
     Función encargada de cambiar el formato de texto a texto con formato de efectivo.
     - Returns: Monto con el formato de efectivo de tipo **String**.
     */
    func textToCurrencyText() -> String {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "es_MX")
        if let textNumber = Double(self) {
            if let textNumberWithFormat = currencyFormatter.string(from: NSNumber(value: textNumber)) {
                return textNumberWithFormat
            }
        }
        return String()
    }
}
