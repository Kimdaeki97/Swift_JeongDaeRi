//
//  ViewController.swift
//  StackView_tutorial
//
//  Created by 김대기 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var phoneNumberBtns: [CircleButton]!
    @IBOutlet var phoneCallBtn: CircleButton!
    
    // 값이 실시간으로 변경되어야함
    var phoneNumberString = ""{
        didSet{
            DispatchQueue.main.async { [weak self] in    // weak self : 메모리를 강하게 잡지 않겠다.
                
                // self 자체를 옵셔녈 해제해야함. 물음표로 처리해도 됨. 지금은 guard let 사용
                // 내가 가지고 있는 self가 값이 없다면 나는 return하겠다.
                guard let self = self else {return}
                
                self.phoneNumberLabel.textColor = .black
                self.phoneNumberLabel.text = self.phoneNumberString
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for btnItem in phoneNumberBtns {
            btnItem.addTarget(self, action: #selector(onNumberBtnClicked(sender:)), for: .touchUpInside)
        }
        
        phoneCallBtn.addTarget(self, action: #selector(onCallBtnClicked(_:)), for: .touchUpInside)
        
        
        
    }

    @objc fileprivate func onNumberBtnClicked(sender: UIButton){
        guard let inputString = sender.titleLabel?.text else {return}
        phoneNumberString.append(inputString)
        }
    
    @objc fileprivate func onCallBtnClicked(_ sender: UIButton){
        phoneNumberString.removeAll()
    }
    
    
    }
    


