
import UIKit

//열거형 상수
public enum LogType:Int16{
    case create = 0
    case edit = 1
}

//클래스의 기능 확장을 위한 extension
extension Int16{
    func toLogType() -> String{
        switch self{
        case 0: return "생성"
        case 1: return "수정"
        default: return ""
        }
    }
}


class LogVC: UITableViewController {
    
    //상위 뷰 컨트롤러로 부터 데이터를 넘겨받을 변수
    var board:BoardMO!
    
    //테이블 뷰에 데이터를 출력할 변수
    lazy var list : [LogMO]! = {
        return self.board.log?.allObjects as! [LogMO]
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        //return 0
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.list.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logcell", for: indexPath)
        
        //행 번호에 해당하는 데이터 가져오기
        let row = self.list[indexPath.row]
        cell.textLabel?.text = "\(row.regdate!) 에 \(row.type.toLogType()) 을 수행했습니다."
        
        return cell
    }
}
