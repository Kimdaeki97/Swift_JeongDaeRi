//
//  ResigterViewController.swift
//  NavigationViewController_tutorial
//
//  Created by 김대기 on 2021/02/05.
//

import Foundation
import UIKit

class ResigterViewController: UIViewController {

    @IBOutlet var btnForLoginViewController: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func onLoginViewControllerBtnClicked(_ sender: UIButton) {
        print("ResigterViewController - onLoginViewControllerBtnClicked() called / 로그인 버튼 클릭!!")
        // 네비게이션 뷰 컨트롤러를 팝 한다.
        self.navigationController?.popViewController(animated: true)
    }
    
}
