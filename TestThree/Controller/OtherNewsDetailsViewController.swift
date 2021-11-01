//
//  OtherNewsDetailsViewController.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 26.10.2021.
//

import UIKit

class OtherNewsDetailsViewController: UIViewController {
  
  var otherDetailsObject = Other(dateLabel: "", historyLabel: "", descriptionNewsTextView: "", imageNews: "")
  @IBOutlet weak var otherNewsDetailsDateLabel: UILabel!
  @IBOutlet weak var otherNewsDetailsHistoryLabel: UILabel!
  @IBOutlet weak var otherNewsDetailsTopicTextView: UITextView!
  @IBOutlet weak var otherNewsDetailsDesriptionTextView: UITextView!
  @IBOutlet weak var otherNewsDetailsImageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
    
    // Do any additional setup after loading the view.
  }
  
  func updateUI(){
    otherNewsDetailsImageView.image = UIImage(data: (try? Data(contentsOf: URL(string: otherDetailsObject.imageNews)!))!)
    otherNewsDetailsDateLabel.text = otherDetailsObject.dateLabel
    otherNewsDetailsHistoryLabel.text = otherDetailsObject.historyLabel
    otherNewsDetailsTopicTextView.text = otherDetailsObject.descriptionNewsTextView
    otherNewsDetailsDesriptionTextView.text = otherDetailsObject.descriptionNewsTextView
  }
}

