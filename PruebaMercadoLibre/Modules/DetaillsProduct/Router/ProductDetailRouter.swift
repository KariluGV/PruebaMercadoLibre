//
//  ProductDetailRouter.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 07/06/23.
//

import Foundation
/// Clase donde se configura la vista cuando es llamada y muestra a la siguiente vista de ser necesario.
final class ProductDetailRouter: ProductDetailRouterProtocol {
    /// Objeto de tipo **ProductDetailView**
    var view: ProductDetailView?
    /// Objeto de tipo **ProductDetailPresenterOutputProtocol & ProductDetailPresenterInputProtocol**
    var presenter: ProductDetailPresenterOutputProtocol & ProductDetailPresenterInputProtocol
    /// Objeto de tipo **ProductDetailInteractorProtocol**
    var interactor: ProductDetailInteractorProtocol?
    /// Inicializador del objeto.
    /// - Parameter product: Producto.
    init(product: Result) {
        view = ProductDetailView()
        presenter = ProductDetailPresenter()
        interactor = ProductDetailInteractor()
        view?.presenter = self.presenter
        presenter.view = self.view
        presenter.router = self
        presenter.interactor = self.interactor
        presenter.product = product
        interactor?.presenter = self.presenter
    }
}
