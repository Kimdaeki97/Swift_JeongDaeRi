//
//  ViewController.swift
//  Autolayout_Code
//
//  Created by 김대기 on 2021/03/20.
//

import UIKit

class ViewController: UIViewController {
    
    // 클로저로 뷰를 설정
    var mySecondView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false //필수
        view.clipsToBounds = true     // cornerRadius 사용할때 필수
        return view
    }()
    
    var myThirdView : myCircleView = {
        let circleView = myCircleView()
        circleView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        circleView.translatesAutoresizingMaskIntoConstraints = false
        return circleView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let myFirstView = UIView()
        myFirstView.translatesAutoresizingMaskIntoConstraints = false
        myFirstView.backgroundColor = .systemPink
        self.view.addSubview(myFirstView)
        
        // x축, y축 위치, 가로, 세로
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        
        // 뷰의 가로,세로 크기 제공
        myFirstView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        myFirstView.layer.cornerRadius = 30
        
        self.view.addSubview(mySecondView)
        // NSLayoutConstraint를 활용해 배열로 만든 후, 뒤에 .isActive = true 를 일일이 작성하지 않게 할 수 있다.
        NSLayoutConstraint.activate([
        mySecondView.widthAnchor.constraint(equalToConstant: 100),
        mySecondView.heightAnchor.constraint(equalToConstant: 100),
        mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10),
        mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 50)
        ])
        
        self.view.addSubview(myThirdView)
        myThirdView.widthAnchor.constraint(equalTo: mySecondView.widthAnchor,multiplier: 1.5).isActive = true
        myThirdView.heightAnchor.constraint(equalTo: mySecondView.heightAnchor,multiplier: 1.5).isActive = true
        myThirdView.topAnchor.constraint(equalTo: mySecondView.bottomAnchor, constant: 50).isActive = true
        myThirdView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}

#if DEBUG

import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    //makeui
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewController_Previews:PreviewProvider {
    static var previews: some View{
        ViewControllerRepresentable()
            .previewDisplayName("Preview IPhone")
    }
}

#endif
