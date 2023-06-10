//
//  HomeProductsPresenter.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 06/06/23.
//

import Foundation
/// Clase que maneja las acciones de la vista y respuestas del interactor.
class HomeProductsPresenter {
    /// Objeto de tipo **HomeProductsViewProtocol**
    weak var view: HomeProductsViewProtocol?
    /// Objeto de tipo **HomeProductsInteractorProtocol**
    var interactor: HomeProductsInteractorProtocol?
    /// Objeto de tipo **HomeProductsRouterProtocol**
    var router: HomeProductsRouterProtocol?
}
extension HomeProductsPresenter: HomeProductsPresenterInputProtocol {
    func showDetailProduct(product: Result) {
        router?.showDetailProduct(product: product)
    }
    func viewDidLoad() {
        view?.loadCollection()
        getProduts()
    }
    func getProduts() {
        interactor?.getProducts()
    }
    func searchProducts(search: String) {
        interactor?.searchProducts(product: search)
    }
}
extension HomeProductsPresenter: HomeProductsPresenterOutputProtocol {
    func bringProducts(products: [Result]) {
        view?.showProducts(products: products)
    }
}
