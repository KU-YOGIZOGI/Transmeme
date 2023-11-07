//
//  LineView.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/06.
//

import UIKit

class LineView: UIView {
    init(color: UIColor) {
        super.init(frame: .zero)
        backgroundColor = color
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
