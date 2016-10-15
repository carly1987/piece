////
////  WordModel.swift
////  Piece
////
////  Created by cieldon on 16/3/17.
////  Copyright © 2016年 cieldon. All rights reserved.
////
//
import Foundation
import SwiftyJSON
class WordModel: NSObject{
    var data : JSON!
    var defaults = NSUserDefaults.standardUserDefaults()
    override init() {
        super.init()
        data = nil
        if let jsonStr = defaults.stringForKey("groups"){
            if let jsonData = jsonStr.dataUsingEncoding(NSUTF8StringEncoding,
                allowLossyConversion: false) {
                    let json = JSON(data: jsonData)
                    data = json
            }
        }
        
    }
    
    func getGroupList() -> JSON? {
        var group : JSON!
        if(data.count > 0){
            group = data
            group.arrayObject?.removeAll()
            for index in 0 ..< data.count{
                if let list = data[index]["list"].arrayObject{
                    let listCount = list.count
                    let title = data[index]["title"].stringValue
                    group.arrayObject?.append(["id": index, "title": title, "total": listCount])
                }
            }
            return group
        }
        return nil
    }
    
    func getGroupData(groupIndex: Int, groupList: JSON) -> AnyObject? {
        if let title = groupList[groupIndex]["title"].string{
            if let total = groupList[groupIndex]["total"].int{
                let totalString = String(total) + "词条"
                return  ["title": title, "total":totalString]
            }
        }
        return nil
    }
    
    func getWordList(groupIndex: Int) -> JSON? {
        if let list = data?[groupIndex]["list"]{
            return list
        }
        return nil
    }
    
    func getItemData(wordIndex: Int, list: JSON) -> AnyObject?{
        if let word = list[wordIndex]["word"].string{
            if let desc = list[wordIndex]["desc"].string{
                return ["word":word, "desc":desc]
            }
        }
        return nil
    }
    
    func getWordData(wordIndex: Int!, groupIndex: Int) -> AnyObject?{
        if(wordIndex != nil){
            let wordData = data?[groupIndex]["list"][wordIndex]
            if let word = wordData!["word"].string{
                if let desc = wordData!["desc"].string{
                    return ["word":word, "desc":desc]
                }
            }
            return nil
        }
        return nil
    }
    
    func changeWord(groupIndx: Int, wordIndex: Int, wordString: String, descString: String){
        data?[groupIndx]["list"][wordIndex]["word"].string = wordString
        data?[groupIndx]["list"][wordIndex]["desc"].string = descString
        saveData()
    }
    
    func addWord(groupIndx: Int, wordString: String, descString: String){
        if var list = data?[groupIndx]["list"].arrayObject{
            list.append(["word": wordString, "desc": descString])
            data?[groupIndx]["list"].arrayObject = list
        }else{
            let jsonStr = "[{\"title\": \"group1\", \"list\": [{\"word\": \""+wordString+"\",\"desc\": \""+descString+"\"}]}]"
            if let jsonData = jsonStr.dataUsingEncoding(NSUTF8StringEncoding,
                allowLossyConversion: false) {
                    let json = JSON(data: jsonData)
                    data = json
            }
        }
        saveData()
    }
    
    func saveData(){
        let jsonStr = data.rawString()!
        defaults.setObject(jsonStr, forKey: "groups")
    }
    
    func saveWord(groupIndx: Int, wordIndex: Int!, wordString: String, descString: String){
        if(wordIndex != nil){
            if let item = getWordData(wordIndex, groupIndex:groupIndx) {
                changeWord(groupIndx, wordIndex: wordIndex, wordString: wordString, descString: descString)
            }else if let list = getWordList(groupIndx){
               addWord(groupIndx, wordString: wordString, descString: descString)
            }
        }else{
            addWord(groupIndx, wordString: wordString, descString: descString)
        }
        
    }

    func saveGroup(groupIndx: Int!, titleString: String){
        if(groupIndx != nil){
            if var group = data?[groupIndx].arrayObject{
               data?[groupIndx]["title"].string = titleString
            }
        }else{
            let jsonStr = "[{\"title\": \""+titleString+"\", \"list\": []}]"
            if let jsonData = jsonStr.dataUsingEncoding(NSUTF8StringEncoding,
                                                        allowLossyConversion: false) {
                let json = JSON(data: jsonData)
                data = json
            }
        }
        saveData()
    }
    
    func deleteWord(groupIndx: Int, wordIndex: Int!){
        if(wordIndex != nil){
            if var list = data?[groupIndx]["list"].arrayObject{
                list.removeAtIndex(wordIndex)
                data?[groupIndx]["list"].arrayObject = list
                saveData()
            }
        }
    }
    
    func deleteGroup(groupIndx: Int){
        if var groups = data.arrayObject{
            groups.removeAtIndex(groupIndx)
            data.arrayObject = groups
            saveData()
        }
    }
}