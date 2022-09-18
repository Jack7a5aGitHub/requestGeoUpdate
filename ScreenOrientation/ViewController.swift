//
//  ViewController.swift
//  ScreenOrientation
//
//  Created by Jack Wong on 2022/09/16.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        return .portrait
    }
    
    
    @IBAction func fullScreenToggle(_ sender: UIButton) {
        
        if #available(iOS 16, *) {
            DispatchQueue.main.async {
                let windowScene = self.view.window?.windowScene
                let orientation = windowScene?.interfaceOrientation
                self.setNeedsUpdateOfSupportedInterfaceOrientations()
                self.navigationController?.setNeedsUpdateOfSupportedInterfaceOrientations()
                windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: orientation == .portrait ? .landscape : .portrait)) { error in
                    print(error)
                    print(windowScene?.effectiveGeometry ?? "")
                }
            }
        }
    }
    
}

