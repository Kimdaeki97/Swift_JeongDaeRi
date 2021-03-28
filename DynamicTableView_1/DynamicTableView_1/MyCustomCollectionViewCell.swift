//
//  MyCustomCollectionViewCell.swift
//  DynamicTableView_1
//
//  Created by 김대기 on 2021/03/23.
//

import Foundation
import UIKit

// 셀의 속성들을 정리해놓은 VC
// VC에서 as!, describing 뒤에 MyCustomCollectionViewCell을 호출

class MyCustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var ProfileImg: UIImageView!
    @IBOutlet var ProfileLabel: UILabel!
    
    var imageName : String = " " {
        didSet{
            print("MyCustomCollectionViewCell / imageName - didSet() : \(imageName)")
            // 셀의 UI 설정
            self.ProfileImg.image = UIImage(systemName: imageName)
            self.ProfileLabel.text = imageName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("MyCustomCollectionViewCell - awakeFromNib() called")
        self.contentView.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        self.contentView.layer.cornerRadius = 8
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    }
}

