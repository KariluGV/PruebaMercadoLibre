//
//  ProductDetailView.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 07/06/23.
//
import UIKit
class ProductDetailView: BaseViewController {
    /// Referencia del presenter.
    var presenter: ProductDetailPresenterInputProtocol?
    /// Label que contiene el nombre del producto.
    @IBOutlet private weak var lblNameProduct: UILabel!
    /// Label que contiene el precio del producto.
    @IBOutlet private weak var lblPrice: UILabel!
    /// Label que contiene el precio original del producto.
    @IBOutlet private weak var lblPriceOriginal: UILabel!
    /// Laben que contiene el porcentaje de descuento del producto.
    @IBOutlet private weak var lblPorcetanjeDiscount: UILabel!
    /// Label que contiene la cantidada disponible de productos
    @IBOutlet private weak var lblAvailableQuantity: UILabel!
    /// Imagen del producto
    @IBOutlet private weak var imgDetailProduct: UIImageView!
    /// Label que contiene la cantidad de productos vendidos.
    @IBOutlet private weak var lblAvailableSould: UILabel!
    /// Laben que contiene la categoría del producto.
    @IBOutlet private weak var lblCategory: UILabel!
    /// Activity para indocar al usuario que se esta cargando la imagen.
    @IBOutlet private weak var activityImage: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}
extension ProductDetailView: ProductDetailViewProtocol {
    /// Función que trae la información del producto.
    /// - Parameter product: Producto.
    func configureProductDetail(product: DetailProduct) {
        lblPriceOriginal.isHidden = (product.isDiscount ?? false)
        lblPorcetanjeDiscount.isHidden = (product.isDiscount ?? false)
        lblPorcetanjeDiscount.text = "\(product.porcetanjeDiscount)"
        lblPriceOriginal.text = product.originalPrice
        lblPrice.text = product.price
        lblAvailableQuantity.text = product.availableQuantity
        lblAvailableSould.text = product.availableSould
        lblCategory.text = product.category
        lblNameProduct.text = product.nameProduct
        imgDetailProduct.loadURLImage(url: product.thumbnail ?? "", completion: { [weak self] in
            self?.activityImage.stopAnimating()
        })
    }
}
