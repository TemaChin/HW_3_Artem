//
//  FriendsViewCell.swift
//  HomeWork_2_AppScreens
//
//  Created by Артем Станкевич on 19.10.2020.
//

import UIKit
/// вьюха друзей для FriendsCell.xib
class FriendsCell: UITableViewCell {
    
    @IBOutlet var cell: FriendsCell!
    @IBOutlet weak var frendsImageView: UIImageView!
    @IBOutlet weak var friendsNameLabel: UILabel!
    @IBOutlet weak var friendsDetailLabel: UILabel!
    @IBOutlet weak var friendsMessageImageView: UIImageView!
    
    final func cellData() {
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

}

