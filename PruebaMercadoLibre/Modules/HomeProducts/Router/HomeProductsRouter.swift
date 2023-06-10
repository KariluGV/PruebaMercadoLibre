//
//  HomeProductsRouter.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 06/06/23.
//

import Foundation
/// Clase donde se configura la vista cuando es llamada y muestra a la siguiente vista de ser necesario.
final class HomeProductsRouter: HomeProductsRouterProtocol {
    /// Objeto de tipo **MainProductsViewController**
    var view: MainProductsViewController?
    /// Objeto de tipo **HomeProductsPresenterOutputProtocol & HomeProductsPresenterInputProtocol**
    var presenter: HomeProductsPresenterOutputProtocol & HomeProductsPresenterInputProtocol
    /// Objeto de tipo **HomeProductsInteractorProtocol**
    var interactor: HomeProductsInteractorProtocol?
    /// Inicializador del objeto.
    init() {
        view = MainProductsViewController()
        presenter = HomeProductsPresenter()
        interactor = HomeProductsInteractor()
        view?.presenter = self.presenter
        presenter.view = self.view
        presenter.router = self
        presenter.interactor = self.interactor
        interactor?.presenter = self.presenter
    }
    /// Función que carga la vista para mostrar el detalle del producto.
    /// - Parameter product: Producto.
    func showDetailProduct(product: Result) {
        if let nextView = ProductDetailRouter(product: product).view {
            view?.navigationController?.pushViewController(nextView, animated: true)
        }
    }
}
