//
//  JokeUtils.swift
//  JokeCollection
//
//  Created by 郭永红 on 2016/10/9.
//  Copyright © 2016年 郭永红. All rights reserved.
//

import UIKit

class JokeUtils: NSObject {
    class func getTextHeight(textStr:String, font: UIFont, lblWidth:CGFloat) -> CGFloat
    {
        let normalStr:NSString = textStr as NSString
        let size = CGSize.init(width: lblWidth, height: CGFloat(MAXFLOAT))
        
        let protDic =  NSDictionary(object: font, forKey: NSFontAttributeName as NSCopying)
        let StringSize = normalStr.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: protDic as? [String : AnyObject], context: nil).size
        
        return StringSize.height + 20;
    }
}
