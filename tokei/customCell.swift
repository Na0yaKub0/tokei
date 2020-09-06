//
//  customCell.swift
//  tokei
//
//  Created by 久保　直哉 on 2020/08/30.
//  Copyright © 2020 久保　直哉. All rights reserved.
//

import UIKit
protocol customdelegate {
    func customdeletecell(index:Int)
}

class customCell: UITableViewCell {
    var delegate:customdelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func sakujo(_ sender: Any) {
        delegate.customdeletecell(index: self.tag)
    }
    
    
}
