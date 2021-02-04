//
//  ViewController.swift
//  NiceApp
//
//  Created by 김대기 on 2021/02/04.
//

import UIKit
import Lottie

class MainViewController: UIViewController {
    
    let titlelabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "구글"
        label.font = UIFont.boldSystemFont(ofSize: 70)
        return label
    }()
    
    // 정의와 동시에 선언
    let animationView: AnimationView = {
       
        let animView = AnimationView(name: "38870-google-logo-effect") // 파일명 뒤에 .json 빼고 입력!!!! 붙이면 파일을 인식 못함
        animView.frame = CGRect(x:0,y:0,width: 400, height: 400)
        
        animView.contentMode = .scaleAspectFill
        
        return animView
    }()
    
    // 뷰가 생성되었을 때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        view.addSubview(animationView)
        animationView.center = view.center
        
        // 애니메이션 실행
        animationView.play{ (finsh) in
            //
            print("애니메이션이 끝났다.")
            
            self.view.backgroundColor = .white
            // 애니메이션 끝나면 제거
            self.animationView.removeFromSuperview()
            
            // 위에서 정의한 레이블을 화면에 추가
            self.view.addSubview(self.titlelabel)
            
            self.titlelabel.translatesAutoresizingMaskIntoConstraints = false
            self.titlelabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.titlelabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        
    }


}


