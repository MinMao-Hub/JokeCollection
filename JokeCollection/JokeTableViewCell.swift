//
//  JokeTableViewCell.swift
//  JokeCollection
//
//  Created by 郭永红 on 2016/9/29.
//  Copyright © 2016年 郭永红. All rights reserved.
//

import UIKit

class JokeTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLbl: UILabel!
    
    @IBOutlet weak var updateTimeLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentLbl.textColor = UIColor.black
        contentLbl.textAlignment = .left
        
        updateTimeLbl.textColor = UIColor.lightGray
        updateTimeLbl.textAlignment = .right
    }

    func setData(joke:JokeModel!) -> Void {
        contentLbl.text = joke.content
        updateTimeLbl.text = "更新时间：" + joke.updateTime;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
