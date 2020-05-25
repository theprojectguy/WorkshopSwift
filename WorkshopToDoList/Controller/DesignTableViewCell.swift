//
//  DesignTableViewCell.swift
//  WorkshopToDoList
//
//  Created by Valentin Mille on 22/05/2020.
//  Copyright © 2020 Valentin Mille. All rights reserved.
//

import UIKit

class DesignTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor

        contentView.backgroundColor = UIColor(named: "Background")
        contentView.clipsToBounds = false
        contentView.layer.cornerRadius = self.contentView.frame.height / 2
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.layer.frame = contentView.frame.inset(by: UIEdgeInsets(top: -10, left: 10, bottom: 10, right: 10))
        contentView.layer.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
