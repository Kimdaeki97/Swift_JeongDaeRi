//
//  ViewController.swift
//  DynamicTableView_1
//
//  Created by 김대기 on 2021/02/06.
//

import UIKit

enum Section {
    case feed, post, board
}

// 클래스
class Feed: Hashable {
    
    let uuid: UUID = UUID()
    var content: String
    init(content: String) {
        self.content = content
    }
    
    //
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.uuid == rhs.uuid
    }
    
    //
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

// 스트럭트
struct Post : Hashable {
    var content: String
}

class MyTableVC: UIViewController {
    
    // 1. 테이블 뷰
    @IBOutlet var myTableView: UITableView!
    
    // 2. 데이터 소스 - UITableViewDataSource Delegate을 대체
    var dataSource : UITableViewDiffableDataSource<Section, Feed>!
    
    // 3. 스냅샷 - 현재 데이터의 상태
    var snapshot : NSDiffableDataSourceSnapshot<Section, Feed>!
    
    let feedArray = [
        Feed(content: "There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."),
        
        Feed(content: "What is Lorem Ipsum?"),
        
        Feed(content: "Why do we use it?"),
        
        Feed(content: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
        
        Feed(content: "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy."),
        
        Feed(content: "Where can I get some?"),
        
        Feed(content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet."),
        
        Feed(content: "It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.")
        
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
//        self.myTableView.dataSource = self
        
        print("contentArray.count : \(feedArray.count)")
        
        // MARK: - 데이터 소스 설정
        // 연결할 테이블 뷰, 쎌 프로바이더 = 보여줄 셀
        dataSource = UITableViewDiffableDataSource<Section, Feed>(tableView:  self.myTableView, cellProvider: {
            (tableView: UITableView, indexPath: IndexPath, identifier: Feed) -> UITableViewCell? in
            
            // 셀 클래스 연결
            let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCellId", for: indexPath) as! MyTableViewCell
            
            return cell
        })
        
        // 데이터 소스의 현재 스냅샷을 만든다
        snapshot = NSDiffableDataSourceSnapshot<Section, Feed>()
        
        // 섹션 추가
        snapshot.appendSections([.feed])
        
        // 방금 추가한 섹션에 아이템을 넣기
        snapshot.appendItems(feedArray, toSection: .feed)
        
        // 현재 스냅샷을 화면에 보여준다.equal
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }
    
    
}
    


extension MyTableVC: UITableViewDelegate {
    
}

//extension MyTableVC: UITableViewDataSource {
//
//    // 테이블 뷰 셀의 갯수
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.feedArray.count
//    }
//
//    // 각 셀에 대한 설정
//    // 드래그를 할 때마다 cellForRowAt를 호출
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = myTableView.dequeueReusableCell(withIdentifier: "myTableViewCell", for: indexPath) as! MyTableViewCell
//
//        cell.userContentLabel.text = feedArray[indexPath.row]
//
//        return cell
//    }




