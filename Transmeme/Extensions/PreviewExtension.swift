//
//  PreviewExtension.swift
//  Transmeme
//
//  Created by 정아현 on 11/4/23.
//

import Foundation

/*
 사용방법
 
 구현 중인 ViewController 파일 내부에 하단의 코드를 작성해준다.
 여러 파일에 작성하면 충돌이 생기기 때문에,
 다른 파일을 작업하기 시작했다면 기존의 파일에서는 삭제 후 새로 추가한다.
 그리고 마지막으로 PR 또는 merge하기 전에 코드를 삭제해 다른 사람이 작업할 때 오류가 나지 않도록 한다.
 */

enum DeviceType {
    case iPhoneSE2
    case iPhone8
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone14Pro

    func name() -> String {
        switch self {
        case .iPhoneSE2:
            return "iPhone SE"
        case .iPhone8:
            return "iPhone 8"
        case .iPhone12Pro:
            return "iPhone 12 Pro"
        case .iPhone12ProMax:
            return "iPhone 12 Pro Max"
        case .iPhone14Pro:
            return "iPhone 14 Pro"
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func showPreview(_ deviceType: DeviceType = .iPhone12Pro) -> some View {
        Preview(viewController: self).previewDevice(PreviewDevice(rawValue: deviceType.name()))
    }
}
#endif

