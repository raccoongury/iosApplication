//
//  DetailViewController.swift
//  1119WebDataXmlParsing
//
//  Created by 503-17 on 19/11/2018.
//  Copyright © 2018 the. All rights reserved.
//

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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
