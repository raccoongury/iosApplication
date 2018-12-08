import UIKit

class Book{
    var id:String!
    var title:String!
    var author:String!
    var summary:String!
}

class RootViewController: UITableViewController, XMLParserDelegate {
    
    //파싱에 필요한 변수
    //태그 하나의 하나의 값을 저장할 변수
    var elementValue:String!
    //Book 1개를 저장할 변수
    var book : Book!
    //전체 데이터를 저장할 변수
    var books = [Book]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //데이터를 다운로드 받을 주소를 URL 인스턴스로 생성
        let url = URL(string:"http://sites.google.com/site/iphonesdktutorials/xml/Books.xml")
        //데이터를 다운로드 받아서 파싱할 객체 만들기
        let xmlParser = XMLParser(contentsOf: url!)
        //파싱을 수행할 객체 지정
        xmlParser!.delegate = self
        //파싱을 요청하고 결과 받기
        _ = xmlParser!.parse()
    }
    //MARK: - XMLParser Delegate
    //여는 태그를 만났을 때 호출되는 메소드
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]){
        //하나의 객체 여는 태그를 만났을 때 객체를 생성
        //태그 들 중에서 속성을 가진 태그가 있으면 그 속성을 찾아와서 저장
        if elementName == "Book"{
            book = Book()
            //Book 태그에 있는 id 속성의 값을 찾아서 book에 저장
            var dic = attributeDict as Dictionary
            book.id = dic["id"]
        }
    }
    
    //닫는 태그를 만났을 때 호출되는 메소드
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?){
        
        //하나의 객체를 닫는 태그를 만난 경우
        if elementName == "Book"{
            books.append(book)
        }
        else if elementName == "title"{
            book.title = elementValue
        }
        else if elementName == "author"{
            book.author = elementValue
        }
        else if elementName == "summary"{
            book.summary = elementValue
        }
        elementValue = nil
    }
    
    //여는 태그와 닫는 태그 사이의 내용을 만났을 때 호출되는 메소드
    func parser(_ parser: XMLParser, foundCharacters string: String){
        if elementValue == nil{
            elementValue = string
        }
        else{
            elementValue = "\(elementValue!)\(string)"
        }
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = books[indexPath.row].title
        
        
        return cell
    }
    
    //셀을 선택했을 때 호출되는 메소드
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //하위 뷰 컨트롤러 만들기
        let detailViewController =
            self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //데이터 넘기기
        detailViewController.book = books[indexPath.row]
        //출력
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}


