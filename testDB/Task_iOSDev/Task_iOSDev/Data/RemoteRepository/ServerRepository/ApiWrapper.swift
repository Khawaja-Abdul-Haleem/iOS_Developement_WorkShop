//
//  ApiWrapper.swift
//  Task_iOSDev
//
//  Created by Khawaja Abdul Haleem on 24/10/2022.
//

import Foundation
import AVKit
////////////////////////
/// This is the Response Returned by Web API Action (i.e. Function)
class APIMessage{
    var ResponseCode : Int = 404// Not-Ok
    var ResponseData : Data?
    var ResponseMessage : String = "OK"
}


//////////////////////
/// This class Is a wrapper which will handle Web API get and post method calls.
class ApiWrapper{
    private let baseURLString = ""
    
    ///////////////////////////
    //// This is for HTTPGet methods
    ////////////////////////////
    func getMethodCall(actionName:String)->APIMessage {
        let apiMessage = APIMessage()
        
        let completePath: String =  "\(baseURLString)\(actionName)"
        guard let url = URL(string: completePath) else{
            apiMessage.ResponseCode = 209//error
            apiMessage.ResponseMessage = "Error : cannot create URL"
            return apiMessage
        }
        let group = DispatchGroup()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let session = URLSession.shared
        group.enter()
        let task = session.dataTask(with: urlRequest){
            
            (data, response, error) in
            
            guard error == nil else {
                apiMessage.ResponseMessage = error.debugDescription
                print("error calling \(actionName)")
                group.leave()
                print(error!)
                return
                
            }
            
            let rurl = (response as! HTTPURLResponse)
            apiMessage.ResponseCode = rurl.statusCode
            
            guard let responseData = data  else{
                apiMessage.ResponseMessage = "error: did not recive data"
                group.leave()
                return
            }
            
            apiMessage.ResponseData = responseData
            apiMessage.ResponseMessage = String(data: data!, encoding: .utf8) ?? rurl.description
            
            group.leave()
        }
        task.resume()
        group.wait()
        return apiMessage
    }
    
    /////////////////////////
    /// This is for HTTPPost methods
    ////////////////////////////
    func postMethodCall(actionName:String,httpBody:Data)->APIMessage {
        let apiMessage = APIMessage()
        
        let completePath: String =  "\(baseURLString)\(actionName)"
        guard let url = URL(string: completePath) else{
            apiMessage.ResponseCode = 209//error
            apiMessage.ResponseMessage = "Error : cannot create URL"
            return apiMessage
        }
        let group = DispatchGroup()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = httpBody
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        
        let session = URLSession.shared
        group.enter()
        let task = session.dataTask(with: urlRequest){
            
            (data, response, error) in
            
            guard error == nil else {
                apiMessage.ResponseMessage = error.debugDescription
                print("error calling \(actionName)")
                group.leave()
                print(error!)
                return
            }
            
            let rurl = (response as! HTTPURLResponse)
            apiMessage.ResponseCode = rurl.statusCode
            
            guard let responseData = data  else{
                apiMessage.ResponseMessage = "error: did not recive data"
                group.leave()
                return
                
            }
            apiMessage.ResponseData = responseData
            
            apiMessage.ResponseMessage = String(data: data!, encoding: .utf8) ?? rurl.description
            
            group.leave()
        }
        task.resume()
        group.wait()
        return apiMessage
    }
    
}
extension NSMutableData {
    func appendString(_ string: String) {
        let data = string.data(using: String.Encoding.utf8, allowLossyConversion: false)
        append(data!)
    }
}

