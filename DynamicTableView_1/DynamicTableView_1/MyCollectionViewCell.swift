//
//  MyCollectionViewCell.swift
//  DynamicTableView_1
//
//  Created by 김대기 on 2021/03/21.
//

import Foundation
import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var profileImg: UIImageView!
    @IBOutlet var profileLabel: UILabel!
    
    var imageName : String = " " {
        didSet{
            print("MyCollectionViewCell / imageName - didSet() : \(imageName)")
            // 셀의 UI 설정
            self.profileImg.image = UIImage(systemName: imageName)
            self.profileLabel.text = imageName
        }
    }
}
