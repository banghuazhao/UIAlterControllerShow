//
//  ViewController.swift
//  UIAlterControllerShow
//
//  Created by Banghua Zhao on 10/23/19.
//  Copyright © 2019 Banghua Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var demoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show Demo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showDemo), for: .touchDown)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(demoButton)
        demoButton.frame = CGRect(x: (UIScreen.main.bounds.width - 100) / 2, y: (UIScreen.main.bounds.height - 40) / 2, width: 100, height: 40)
    }
    
    deinit {
        print(UIApplication.shared.windows.count)
    }

    @objc func showDemo() {
        let alterController = CustomAlterController(title: "Title", message: "Message...", preferredStyle: .alert)
        alterController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alterController.show()
    }
}

class CustomAlterController: UIAlertController {
    
    var window: UIWindow?
    
    func show() {
        window = UIWindow()
        window?.backgroundColor = .clear
        window?.rootViewController = UIViewController()
        window?.makeKeyAndVisible()
        window?.rootViewController?.present(self, animated: true, completion: nil)
    }
}
