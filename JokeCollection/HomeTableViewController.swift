//
//  HomeTableViewController.swift
//  JokeCollection
//
//  Created by 郭永红 on 2016/9/29.
//  Copyright © 2016年 郭永红. All rights reserved.
//

import UIKit
import Alamofire

class HomeTableViewController: UITableViewController {

    
    var jokeListArray:Array<JokeModel> = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.tableFooterView = UIView()
        
        
        let cDate:Date = Date()
        let timeInterval = cDate.timeIntervalSince1970
        let timeStr = String(format:"%.f",timeInterval)
        
        
        let parma:[String : Any] = ["sort":"desc",
                     "page":1,
                     "pagesize":20,
                     "time":timeStr,
                     "key":"b97a9a346772e6727b0eecc1d52f03a1"
                     ]
        
        DataRequest.requestData(urlStr: "http://japi.juhe.cn/joke/content/list.from", parmas: parma) { (responseObject) in
            
            print(responseObject)
            
            if let jsonResult = responseObject.result.value as? [String: Any] {
                // do whatever with jsonResult
                print(jsonResult)
                
                if jsonResult["reason"] as? String == "Success"
                {
                    let jsonResult:[String: AnyObject] = jsonResult["result"] as! [String: AnyObject]
                    
                    let listArr:Array<NSDictionary> = jsonResult["data"] as! Array<NSDictionary>
                    
                    for objectDic in listArr
                    {
                        print(objectDic)
                        
                        let joke = JokeModel()
                        joke.content = objectDic.object(forKey: "content") as! String
                        joke.updateTime = objectDic.object(forKey: "updatetime") as! String
                        
                        self.jokeListArray.append(joke)
                    }
                    
                    
                    self.tableView.reloadData()
                    
                }else{
                    
                    if jsonResult["error_code"] as? String != "0"
                    {
                        print("请求失败\(jsonResult["result"])")
                    }
                    else
                    {
                        print("暂无数据，请稍候再试")
                    }
                }
                
                
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jokeListArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JokeTableViewCell", for: indexPath) as! JokeTableViewCell
        // Configure the cell...
        cell.selectionStyle = .none
        
        cell.setData(joke: jokeListArray[indexPath.row])
        

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 21.5 + JokeUtils.getTextHeight(textStr: jokeListArray[indexPath.row].content, font: UIFont.systemFont(ofSize: 15), lblWidth: kScreenWidth - 16);
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
