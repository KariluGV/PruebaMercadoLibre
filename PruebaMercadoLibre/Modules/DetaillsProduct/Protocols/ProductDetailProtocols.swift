//
//  ProductDetailProtocols.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 07/06/23.
//

import Foundation
/// Protocolo que define los métodos y atributos para el view de ProductDetail.
protocol ProductDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    /// Objeto de tipo **ProductDetailPresenterInputProtocol**
    var presenter: ProductDetailPresenterInputProtocol? { get set }
    /// Función que trae la información del producto.
    /// - Parameter product: Producto.
    func configureProductDetail(product: DetailProduct)
}
/// Protocolo que define los métodos y atributos para el view de ProductDetail.
protocol ProductDetailInteractorProtocol: AnyObject {
    /// Objeto de tipo **ProductDetailPresenterOutputProtocol**
    var presenter: ProductDetailPresenterOutputProtocol? { get set }
}
/// Protocolo que define los métodos y atributos para el Interactor de ProductDetail.
protocol ProductDetailPresenterInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    /// Objeto de tipo **ProductDetailViewProtocol**
    var view: ProductDetailViewProtocol? { get set }
    /// Objeto de tipo **ProductDetailInteractorProtocol**
    var interactor: ProductDetailInteractorProtocol? { get set }
    /// Objeto de tipo **ProductDetailRouterProtocol**
    var router: ProductDetailRouterProtocol? { get set }
    /// Producto seleccionado.
    var product: Result? { get set }
    func viewDidLoad()
}
/// Protocolo que define los métodos y atributos para el Interactor de ProductDetail.
protocol ProductDetailPresenterOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
}
/// Protocolo que define los métodos y atributos para el routing de ProductDetail.
protocol ProductDetailRouterProtocol: AnyObject {
    // PRESENTER -> ROUTING
    /// Objeto de tipo **ProductDetailView**
    var view: ProductDetailView? { get set }
    /// Objeto de tipo **ProductDetailInteractorProtocol**
    var interactor: ProductDetailInteractorProtocol? { get set }
    /// Objeto de tipo **ProductDetailPresenterInputProtocol & ProductDetailPresenterOutputProtocol**
    var presenter: ProductDetailPresenterInputProtocol & ProductDetailPresenterOutputProtocol { get set }
}
