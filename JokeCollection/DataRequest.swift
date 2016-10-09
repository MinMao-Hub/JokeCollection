//
//  DataRequest.swift
//  JokeCollection
//
//  Created by 郭永红 on 2016/9/29.
//  Copyright © 2016年 郭永红. All rights reserved.
//

import UIKit
import Alamofire

class DataRequest: NSObject {

    
    class func requestData(urlStr aUrlStr: String!, parmas aParmas: Parameters!, completeHandler: ((_ responseObj:DataResponse<Any>) -> Void)?)
    {   
        Alamofire.request(aUrlStr, parameters:aParmas).responseJSON { (dataResponse: DataResponse) in
            
            completeHandler!(dataResponse)
        }
    }
    
}
