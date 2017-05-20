//
//  AboutController.swift
//  X of 365
//
//  Created by Jeremy Brooks on 5/20/17.
//  Copyright © 2017 Jeremy Brooks. All rights reserved.
//

import UIKit

class AboutController: UIViewController {

    @IBOutlet weak var content: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var html = "<html>"
        html += "<head><style>h1 {text-align:center;}</style></head>"
        html += "<body>"
        html += "<h1>X of 365</h1>"
        html += "<p>Easily find the ordinal day of any year. Handy for 365 projects.</p>"
        html += "<p>by Jeremy Brooks</p>"
        html += "<p>source code available on GitHub</p>"
        html += "</body></html>"

        self.content.loadHTMLString(html, baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
