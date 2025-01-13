//
//  MyCustomTableViewCell.swift
//  TableViews
//
//  Created by Brais Moure on 25/02/2020.
//  Copyright © 2020 MoureDev. All rights reserved.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .blue
        
        mySecondLabel.numberOfLines = 0
        
        backgroundColor = .gray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print(myFirstLabel.text ?? "")
    }
    
}
