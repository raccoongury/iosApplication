
import UIKit

class DetailViewController: UIViewController {
    var book : Book!

    
    @IBOutlet weak var lblSummary: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblTitle.text = book.title
        lblAuthor.text = book.author
        lblSummary.text = book.summary
        
        self.title = book.title

    }
}
