//
//  MyCollectionVC.swift
//  DynamicTableView_1
//
//  Created by 김대기 on 2021/03/21.
//

import Foundation
import UIKit

class MyCollectionVC: UIViewController {
    
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet var mySegmentControl: UISegmentedControl!
    
    fileprivate let systemImageNameArray = [
            "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "moon", "zzz", "sparkles", "cloud", "tornado", "smoke.fill", "tv.fill", "gamecontroller", "headphones", "flame", "bolt.fill", "hare", "tortoise", "ant", "hare", "car", "airplane", "heart", "bandage", "waveform.path.ecg", "staroflife", "bed.double.fill", "signature", "bag", "cart", "creditcard", "clock", "alarm", "stopwatch.fill", "timer"
        ]
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MyCollectionVC - viewDidLoad() called")
        
        // 콜렉션 뷰에 대한 설정
        myCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
}

// 위에 클래스에서 UIViewController 옆에 ,UICollectionViewDataSource,UICollectionViewDelegate 추가해서 설정 가능
// 데이터 소스 설정 - 데이터와 관련된 것들
extension MyCollectionVC: UICollectionViewDataSource {
    
    // 각 세션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.systemImageNameArray.count
    }
    
    // 각 콜렉션 뷰 셀에 대한 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellId = String(describing: MyCollectionViewCell.self)
        print("cellId : \(cellId)")
        
        // 셀의 인스턴스
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MyCollectionViewCell
        
        cell.imageName = self.systemImageNameArray[indexPath.item]
        
//        cell.contentView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        cell.contentView.layer.cornerRadius = 8
//        cell.contentView.layer.borderWidth = 1
//        cell.contentView.layer.borderColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
//
//         데이터에 따른 셀 UI 변경
//         이미지에 대한 설정
//        cell.profileImg.image = UIImage(systemName: self.systemImageNameArray[indexPath.item])
//        // 라벨 설정
//        cell.profileLabel.text = self.systemImageNameArray[indexPath.item]
//        
        return cell
    }
    
    
}

// 콜렉션 뷰 델리게이트 - 액션과 관련된 것들
extension MyCollectionVC: UICollectionViewDelegate {
    
}
