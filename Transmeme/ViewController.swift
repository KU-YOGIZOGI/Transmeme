//
//  ViewController.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/09/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewController().showPreview(.iPhone14Pro)
    }
}
#endif


