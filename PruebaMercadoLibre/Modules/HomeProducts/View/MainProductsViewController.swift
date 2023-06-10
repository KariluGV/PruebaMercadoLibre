//
//  MainProductsViewController.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 06/06/23.
//
import UIKit
final class MainProductsViewController: BaseViewController {
    /// Collecion view que contiene el listado de Productos.
    private var collectionProducts: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 30, left: 20, bottom: 0, right: 20)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return collectionView
    }()
    /// UIView que contieme el UISearchBar  para la busqueda de productos.
    private var searchView = UIView()
    /// UISearchBar para la busqueda de productos.
    private var textFieldSearch = UISearchBar()
    /// Botón de carrito de compas.
    private var buttomCar = UIButton()
    ///  UIActivityIndicatorView que indica el progreso de carga al usuario.
    private var loaderView = UIActivityIndicatorView()
    /// Referencia al presenter.
    var presenter: HomeProductsPresenterInputProtocol?
    /// Arreglo de tipo **Result**.
    var products: [Result]?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}
extension MainProductsViewController: HomeProductsViewProtocol {
    /// Funcion que configura la vista.
    func loadCollection() {
        searchView.translatesAutoresizingMaskIntoConstraints = false
        collectionProducts.translatesAutoresizingMaskIntoConstraints = false
        textFieldSearch.translatesAutoresizingMaskIntoConstraints = false
        buttomCar.translatesAutoresizingMaskIntoConstraints = false
        imageAdress.translatesAutoresizingMaskIntoConstraints = false
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionProducts)
        view.addSubview(searchView)
        view.addSubview(loaderView)
        searchView.addSubview(textFieldSearch)
        searchView.addSubview(buttomCar)
        searchView.addSubview(imageAdress)
        searchView.addSubview(labelAddress)
        NSLayoutConstraint.activate([
            /// Constrains Search Bar.
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchView.heightAnchor.constraint(equalToConstant: 60),
            /// Constrains Collection View.
            collectionProducts.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 15),
            collectionProducts.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionProducts.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionProducts.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            /// Constrains LoaderView.
            loaderView.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 15),
            loaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loaderView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            /// Constrains ButtomCar.
            buttomCar.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
            buttomCar.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -15),
            buttomCar.heightAnchor.constraint(equalToConstant: 40),
            buttomCar.widthAnchor.constraint(equalToConstant: 40),
            /// Constrains TextFieldSearch.
            textFieldSearch.topAnchor.constraint(equalTo: searchView.topAnchor, constant: 10),
            textFieldSearch.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 15),
            textFieldSearch.trailingAnchor.constraint(equalTo: buttomCar.leadingAnchor, constant: -10),
            textFieldSearch.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.backgroundColor = .systemYellow
        searchView.backgroundColor = .systemYellow
        loaderView.startAnimating()
        loaderView.hidesWhenStopped = true
        loaderView.style = .large
        loaderView.backgroundColor = .white.withAlphaComponent(0.2)
        configureCartBottom()
        configureTextFieldSearch()
        configueCollection()
    }
    /// Función que configura el **UICollectionView*.
    func configueCollection() {
        collectionProducts.delegate = self
        collectionProducts.dataSource = self
        collectionProducts.register(UINib(nibName: HomeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    /// Función que configura el **UISearchBar*.
    func configureTextFieldSearch() {
        textFieldSearch.backgroundImage = UIImage()
        textFieldSearch.searchTextField.backgroundColor = .white
        textFieldSearch.layer.cornerRadius = 16
        textFieldSearch.placeholder = "Buscar producto"
        textFieldSearch.delegate = self
    }
    /// Función que configura el **UIButton*.
    func configureCartBottom() {
        buttomCar.tintColor = .white
        buttomCar.setImage(UIImage(systemName: "cart"), for: .normal)
    }
    /// Función que trae la información de los productos y actualiza el UICollectionView.
    /// - Parameter product: Arreglo de tipo **[Result]**.
    func showProducts(products: [Result]) {
        self.products = products
        DispatchQueue.main.async { [weak self] in
            self?.loaderView.stopAnimating()
            self?.collectionProducts.reloadData()
        }
    }
}
/// Extensión de la clase donde se configura el UICollectionView.
extension MainProductsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products?.count ?? .zero
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        item.layer.borderColor = UIColor.lightGray.cgColor
        item.layer.cornerRadius = 8
        item.layer.masksToBounds = false
        item.layer.shadowColor = UIColor.lightGray.cgColor
        item.layer.shadowOpacity = 15.0
        item.layer.shadowOffset = .zero
        item.layer.shadowRadius = 6
        if let safeProducts = products {
            item.configure(item: safeProducts[indexPath.row])
        }
        return item
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width / 2.4
        return CGSize(width: width, height: width * 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let safeProduct = products?[indexPath.row] {
            presenter?.showDetailProduct(product: safeProduct)
        }
    }
}
/// Extensión de la clase donde se configura el UISearchBarDelegate.
extension MainProductsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            loaderView.startAnimating()
            presenter?.getProduts()
        } else {
            loaderView.startAnimating()
            presenter?.searchProducts(search: searchText)
        }
    }
}
