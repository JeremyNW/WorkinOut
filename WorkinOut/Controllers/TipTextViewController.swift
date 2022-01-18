//
//  TipTextViewController.swift
//  WorkinOut
//
//  Created by Jeremy Warren on 1/18/22.
//

import UIKit

class TipTextViewController: UIViewController {

    @IBOutlet weak var tipTextView: UITextView!
    var tip: Tip?
    override func viewDidLoad() {
        super.viewDidLoad()

        tipTextView.text = tip?.text
        title = tip?.title
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
