//
//  ProductDetailPresenter.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 07/06/23.
//

import Foundation
/// Clase que maneja las acciones de la vista y respuestas del interactor.
final class ProductDetailPresenter {
    /// Objeto de tipo **ProductDetailViewProtocol**
    weak var view: ProductDetailViewProtocol?
    /// Objeto de tipo **ProductDetailInteractorProtocol**
    var interactor: ProductDetailInteractorProtocol?
    /// Objeto de tipo **ProductDetailRouterProtocol**
    var router: ProductDetailRouterProtocol?
    /// Producto seleccionado.
    var product: Result?
}
extension ProductDetailPresenter: ProductDetailPresenterInputProtocol {
    func viewDidLoad() {
        if let safeProduct = product {
            let originalPrice = Utils.convertToDouble(product?.originalPrice ?? 0)
            let finalPrice = Utils.convertToDouble(Int(Double(product?.price ?? 0)))
            let porcentaje = Utils.conversionPercentageFloat(priceProduct: safeProduct.price ?? 0.0, originalPriceProduct: Double(safeProduct.originalPrice ?? Int(0.0)))
            let procentajeFinal = Utils.roundToDecimals(porcentaje, decimals: 2)
            let isDiscount = safeProduct.originalPrice == nil ? true : safeProduct.price != Double(safeProduct.originalPrice ?? .zero) ? false : true
            self.view?.configureProductDetail(product: DetailProduct(nameProduct: safeProduct.title,
                                                                     originalPrice: "\(String(describing: originalPrice))".textToCurrencyText(),
                                                                     price: "\(String(describing: finalPrice))".textToCurrencyText(),
                                                                     porcentaje: porcentaje,
                                                                     procentajeFinal: procentajeFinal,
                                                                     porcetanjeDiscount: "\(procentajeFinal)" + " % OFF",
                                                                     availableQuantity: "Cantidad: " + Utils.unwrappedText("\(String(describing: safeProduct.availableQuantity))"),
                                                                     availableSould: "Cantidad: " + Utils.unwrappedText("\(String(describing: safeProduct.soldQuantity))"),
                                                                     category: safeProduct.domainID,
                                                                     thumbnail: safeProduct.thumbnail, isDiscount: isDiscount))} }}

extension ProductDetailPresenter: ProductDetailPresenterOutputProtocol {
}
