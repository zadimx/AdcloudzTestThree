//
//  OtherTableViewCell.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 28.10.2021.
//

import UIKit

class OtherTableViewCell: UITableViewCell {

  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var historyLabel: UILabel!
  @IBOutlet weak var descriptionNewsTextView: UITextView!
  @IBOutlet weak var imageNews: UIImageView!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func set(object: Other){
        self.dateLabel.text = object.dateLabel
        self.imageNews.image = UIImage(data: (try? Data(contentsOf: URL(string: object.imageNews)!))!)
        self.historyLabel.text = object.historyLabel
        self.descriptionNewsTextView.text = object.descriptionNewsTextView
    }
}
