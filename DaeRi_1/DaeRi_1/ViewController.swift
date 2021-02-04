//
//  ViewController.swift
//  DaeRi_1
//
//  Created by 김대기 on 2021/02/04.
//

import UIKit

class ViewController: UIViewController {
    
    // 제목
    var titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "정대리!"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.textColor = .white
        
        return label
        
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 배경색은 빨간색으로 지정
        view.backgroundColor = .red
        // 위에서 지정한 타이틀 레이블 보여주기
        view.addSubview(titleLabel)
        
        // 화면 중앙 정렬
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }


}

