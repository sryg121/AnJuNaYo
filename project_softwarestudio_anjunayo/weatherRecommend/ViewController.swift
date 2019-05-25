//
//  ViewController.swift
//  project_softwarestudio_anjunayo
//
//  Created by 안재은 on 03/05/2019.
//  Copyright © 2019 SwiftHelloWorld. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set navigation bar title image
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logosample")
        imageView.image = image
        navigationItem.titleView = imageView
    }
}

