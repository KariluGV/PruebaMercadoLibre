//
//  HomeCollectionViewCell.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 06/06/23.
//
import UIKit
final class HomeCollectionViewCell: UICollectionViewCell {
    /// Identificador de la celda.
    static let identifier = "HomeCollectionViewCell"
    /// Imagen del producto
    @IBOutlet private weak var imgProducts: UIImageView!
    /// Nombre del producto
    @IBOutlet private weak var lblNameProducts: UILabel!
    /// Activity para indocar al usuario que se esta cargando la imagen.
    @IBOutlet private weak var activityImage: UIActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setStyles()
        activityImage.startAnimating()
        activityImage.hidesWhenStopped = true
    }
    /// Función que configura los estilos de la celda.
    func setStyles() {
        lblNameProducts.font = UIFont.boldSystemFont(ofSize: 15)
        lblNameProducts.textColor = .black
    }
    /// Función que configura la información de la celda.
    /// - Parameter item: Producto.
    func configure(item: Result) {
        imgProducts.loadURLImage(url: item.thumbnail ?? "") { [weak self] in
            self?.activityImage.stopAnimating()
        }
        lblNameProducts.text = item.title
    }
}
