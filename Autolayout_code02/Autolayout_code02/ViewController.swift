//
//  ViewController.swift
//  Autolayout_code02
//
//  Created by 김대기 on 2021/03/20.
//

import UIKit

class ViewController: UIViewController {
    
    var someViewBottomConstraint : NSLayoutConstraint?
    
    override func loadView() {
        super.loadView()
        print("ViewController - loadView()")
        
        view.backgroundColor = UIColor(named: "MY_YELLOW")
        
        let someView = UIView()
        someView.backgroundColor = UIColor(named: "MY_BLUE")
        someView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(someView)
        someView.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            someView.widthAnchor.constraint(equalToConstant: 100),
            someView.heightAnchor.constraint(equalToConstant: 50),
            someView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            //someView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        someViewBottomConstraint = NSLayoutConstraint(item: someView, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
        someViewBottomConstraint?.isActive = true
        
        let moveViewUpBtn = UIButton(type: .system)
        moveViewUpBtn.translatesAutoresizingMaskIntoConstraints = false
        moveViewUpBtn.backgroundColor = .white
        moveViewUpBtn.setTitle("위로 올리기", for: .normal)
        moveViewUpBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        moveViewUpBtn.setTitleColor(.black, for: .normal)
        moveViewUpBtn.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        moveViewUpBtn.layer.cornerRadius = 8
        moveViewUpBtn.addTarget(self, action: #selector(moveviewup), for: .touchUpInside)
        self.view.addSubview(moveViewUpBtn)
        moveViewUpBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        moveViewUpBtn.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 150).isActive = true
        
    }
    
    @objc fileprivate func moveviewup(){
        print("ViewController - moveViewUp() called")
        
        someViewBottomConstraint?.constant -= 100
        
        // self.view.layoutIfNeeded()
        UIViewPropertyAnimator(duration: 0.3, curve: .easeOut, animations: { [weak self] in guard let self = self else {return}
            self.view.layoutIfNeeded()
        }).startAnimation()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController - viewDidLoad()")
        // Do any additional setup after loading the view.
        
    }


}

#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    // makeui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}
        
struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
        .edgesIgnoringSafeArea(.all)
        .previewDisplayName("IPhone 12")
    }
}


#endif
