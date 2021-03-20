//
//  myCircleView.swift
//  Autolayout_Code
//
//  Created by 김대기 on 2021/03/20.
//

import Foundation
import UIKit

class myCircleView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews() // swift에선 강제로 해주어야함 UIView에 layoutSubview를 설정
        print("MycircleView - layoutSubviews() called")
        self.layer.cornerRadius = self.frame.height / 2
    }
}
