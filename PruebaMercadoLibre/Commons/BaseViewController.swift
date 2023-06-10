//
//  BaseViewController.swift
//  PruebaMercadoLibre
//
//  Created by KARILU GUTIERREZ VICENTE on 09/06/23.
//
import UIKit
/// Clase con la base de el comportamiento y funciones necesarias en los **ViewControllers**
class BaseViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
