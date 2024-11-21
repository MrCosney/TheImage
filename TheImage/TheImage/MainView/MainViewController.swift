//
//  ViewController.swift
//  TheImage
//
//  Created by Nikita Kuzmin on 19.11.2024.
//

import UIKit

final class MainViewController: UIViewController {

    // MARK: - LifeCycle
    
    override func loadView() {
        view = MainContentView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
