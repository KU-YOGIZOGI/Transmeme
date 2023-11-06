//
//  UILabel+Extension.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/04.
//

import Foundation
import UIKit

extension UILabel {
    
    /* 텍스트 구간 색상 변경 */
       func setTextColor(_ color: UIColor, range: NSRange) {
           guard let attributedString = self.mutableAttributedString() else { return }
           
           attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
           self.attributedText = attributedString
       }
    
    /* 텍스트 구간 폰트 변경 */
       func setFont(_ font: UIFont, range: NSRange) {
           guard let attributedString = self.mutableAttributedString() else { return }
           
           attributedString.addAttribute(NSAttributedString.Key.font, value: font, range: range)
           self.attributedText = attributedString
       }
       
       /* 텍스트 구간 볼드 폰트 변경 */
       func setBoldFont(_ boldFontName: String, range: NSRange) {
           guard let font = self.font,
                 let boldFont = UIFont(name: boldFontName, size: font.pointSize) else {
               return
           }
           
           return setFont(boldFont, range: range)
           //
       }
    
    /* 밑줄 추가 */
      func setUnderline(range: NSRange) {
          guard let attributedString = self.mutableAttributedString() else { return }
          
          attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
          self.attributedText = attributedString
      }
      /* UI버튼의 밑줄일 경우 사용 방식
       botton.titleLabel?.setUnderline(range: NSRange(location: 0, length: botton.currentTitle?.count ?? 0))
       */
       
       /* AttributedString이 설정되어있지 않으면 생성하여 반환한다. ( 내가 설정한 모든 속성 값이 초기화 방지 ) */
       private func mutableAttributedString() -> NSMutableAttributedString? {
           guard let labelText = self.text, let labelFont = self.font else { return nil }
           
           var attributedString: NSMutableAttributedString?
           if let attributedText = self.attributedText {
               attributedString = attributedText.mutableCopy() as? NSMutableAttributedString
           } else {
               attributedString = NSMutableAttributedString(string: labelText,
                                                            attributes: [NSAttributedString.Key.font :labelFont])
           }
           
           return attributedString
       }
    

   }
/* 하이라이트 */
extension NSMutableAttributedString {
    
    /// 프로퍼티 설명 - text: 변형하고자하는 텍스트, color: text의 변형예정인 tintColor 색상
    struct HighlightTarget {
        let text: String
        let color: UIColor
    }
    
    /// targets에 해당하는 HighlightTarget 의 text를 color로 변형하여 리턴한다.
    func highlight(_ targets: [HighlightTarget]) -> NSMutableAttributedString {
        let source = string
        
        for target in targets {
            let range = (source as NSString).range(of: target.text)
            addAttribute(.foregroundColor, value: target.color, range: range)
        }
        
        return self
    }
}

class BasePaddingLabel: UILabel {
    
    private var padding = UIEdgeInsets(top: 2.0, left: 4.0, bottom: 2.0, right: 4.0)
    
    convenience init(padding: UIEdgeInsets) {
        self.init()
        self.padding = padding
    }
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: padding))
    }
    
    //안의 내재되어있는 콘텐트의 사이즈에 따라 height와 width에 padding값을 더해줌
    override var intrinsicContentSize: CGSize {
        var contentSize = super.intrinsicContentSize
        contentSize.height += padding.top + padding.bottom
        contentSize.width += padding.left + padding.right
        
        return contentSize
    }
}
