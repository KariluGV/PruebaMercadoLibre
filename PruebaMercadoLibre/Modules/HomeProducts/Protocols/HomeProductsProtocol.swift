//
//  HomeProductsProtocol.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 06/06/23.
//
import Foundation
/// Protocolo que define los métodos y atributos para el view de HomeProducts.
protocol HomeProductsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    /// Objeto de tipo **ProductDetailPresenterInputProtocol**
    var presenter: HomeProductsPresenterInputProtocol? { get set }
    /// Función que configura el  UICollectionView.
    func loadCollection()
    /// Función que muestra el listado de los productos.
    /// - Parameters:
    /// - products: Arreglo de tipo **[Result]** con la lista de productos.
    func showProducts(products: [Result])
}
/// Protocolo que define los métodos y atributos para el view de HomeProducts.
protocol HomeProductsInteractorProtocol: AnyObject {
    /// Objeto de tipo **HomeProductsPresenterOutputProtocol**
    var presenter: HomeProductsPresenterOutputProtocol? { get set }
    /// Función que trae los productos.
    func getProducts()
    /// Funcion que buscar los productos.
    /// - Parameters:
    /// - products: Lista de productos.
    func searchProducts(product: String)
}
/// Protocolo que define los métodos y atributos para el Interactor de HomeProducts.
protocol HomeProductsPresenterInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    /// Objeto de tipo **HomeProductsViewProtocol**
    var view: HomeProductsViewProtocol? { get set }
    /// Objeto de tipo **HomeProductsInteractorProtocol**
    var interactor: HomeProductsInteractorProtocol? { get set }
    /// Objeto de tipo **HomeProductsRouterProtocol**
    var router: HomeProductsRouterProtocol? { get set }
    func viewDidLoad()
    /// Función que trae los productos.
    func getProduts()
    /// Funcion que muestra los productos.
    /// - Parameters:
    /// - products: Producto.
    func showDetailProduct(product: Result)
    /// Funcion que buscar los productos.
    /// - Parameters:
    /// - search: Busqueda de string.
    func searchProducts(search: String)
}
/// Protocolo que define los métodos y atributos para el Interactor de HomeProducts.
protocol HomeProductsPresenterOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func bringProducts(products: [Result])
}
/// Protocolo que define los métodos y atributos para el routing de ProductDetail.
protocol HomeProductsRouterProtocol: AnyObject {
    // PRESENTER -> ROUTING
    /// Objeto de tipo **MainProductsViewController**
    var view: MainProductsViewController? { get set }
    /// Objeto de tipo **HomeProductsInteractorProtocol**
    var interactor: HomeProductsInteractorProtocol? { get set }
    /// Objeto de tipo **HomeProductsPresenterInputProtocol & HomeProductsPresenterOutputProtocol**
    var presenter: HomeProductsPresenterInputProtocol & HomeProductsPresenterOutputProtocol { get set }
    /// Funcion que muestra los productos.
    /// - Parameters:
    /// - products: Producto.
    func showDetailProduct(product: Result)
}
