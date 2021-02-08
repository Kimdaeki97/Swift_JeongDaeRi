//
//  ViewController.swift
//  DynamicTableView_1
//
//  Created by 김대기 on 2021/02/06.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myTableView: UITableView!
    
    let contentArray = [
        "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain...",
        
        "What is Lorem Ipsum?",
        
        "Why do we use it?",
        
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
        
        "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
        
        "Where can I get some?",
        
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.",
        
        "It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.",
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 셀 리소스 파일 가져오기
        // let myTableViewCellNib = UINib(nibName: "MyTableViewCell", bundle: <#T##Bundle?#>)
        let myTableViewCellNib = UINib(nibName: String(describing: MyTableViewCell.self), bundle: nil)
        
        // 셀에 리소스 등록
        self.myTableView.register(myTableViewCellNib, forCellReuseIdentifier: "myTableViewCell")
        
        self.myTableView.rowHeight = UITableView.automaticDimension //자동으로 계산
        self.myTableView.estimatedRowHeight = 120 // 예상하는 높이는 120
        
        // 아주 중요
        // 밑에 델리게이트와 데이터소스를 연결
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        print("contentArray.count : \(contentArray.count)")
        
    }
    
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    // 테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    // 각 셀에 대한 설정
    // 드래그를 할 때마다 cellForRowAt를 호출
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
        
        cell.userContentLabel.text = contentArray[indexPath.row]
        
        return cell
    }
}
