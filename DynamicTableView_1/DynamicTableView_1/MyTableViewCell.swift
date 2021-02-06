//
//  MyTableViewCell.swift
//  DynamicTableView_1
//
//  Created by 김대기 on 2021/02/06.
//

import Foundation
import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet var userContentLabel: UILabel!
    
    @IBOutlet var userProfileImg: UIImageView!
    
    // 셀이 랜더링(그릴때) 될때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("MyTableViewCell - awakeFromNib() called")
        
        userProfileImg.layer.cornerRadius = userProfileImg.frame.width / 2
        
    }
}
