//
//  Response+NSCoding.swift
//  Alamofire
//
//  Created by mac on 2019/7/4.
//

import UIKit

/// Response
public class Caccc: NSObject, NSCoding {
    
    public var statusCode: Int = 0
    public var data: Data = Data.init()
    public var request: URLRequest?
    public var response: URLResponse?
    
    init(statusCode: Int, data: Data, request: URLRequest?, response: URLResponse?) {
        
        self.response = response
        self.statusCode = statusCode
        self.request = request
        self.data = data
        
    }
    
    override init() { }
    /// decode
    required public init?(coder aDecoder: NSCoder) {
        
        if let response = aDecoder.decodeObject(forKey: "cacheResponse") as? URLResponse {
            self.response = response
        }
        
        if let data = aDecoder.decodeObject(forKey: "cacheData") as? Data {
            self.data = data
        }
        
        if let request = aDecoder.decodeObject(forKey: "cacheRequest") as? URLRequest {
            self.request = request
        }
        
        self.statusCode = aDecoder.decodeInteger(forKey: "cacheStatusCode")
        
    }
    /// encode
    public func encode(with aCoder: NSCoder) {
        
        if let resp = response {
            aCoder.encode(resp, forKey: "cacheResponse")
        }
        
        if let requ = request {
            aCoder.encode(requ, forKey: "cacheRequest")
        }
        
        aCoder.encode(statusCode, forKey: "cacheStatusCode")
        
        aCoder.encode(data, forKey: "cacheData")
        
    }
}


