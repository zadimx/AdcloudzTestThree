//
//  CollectionTableViewCell.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 01.11.2021.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

  static let identifier = "CollectionTableViewCell"
  
  static func nib() -> UINib{
    return UINib(nibName: "CollectionTableViewCell", bundle: nil)
  }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
