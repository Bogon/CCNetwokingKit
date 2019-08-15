//
//  GeekDemonirationAPI.swift
//  GeekDataKit_Example
//
//  Created by mac on 2019/7/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import Alamofire
import CCNetwokingKit
import SwifterSwift

enum GeekDemonirationAPI {
    
    /*************************************| 趣天气数据接口 |*********************************/
    case fifteenDay(value: [String: Any]?)                     /// 15天天气接口：areaCode
    case seventyTwoHours(value: [String: Any]?)                /// 72小时接口：areaCode
    case getWeatherRealTime(value: [String: Any]?)             /// 实时预告接口：areaCode
    case getPredictionQuery                                    /// 获取运势接口
}

extension GeekDemonirationAPI: TargetType {
    
    /// 网络请求头设置
    var headers: [String : String]? {
        /*
         return ["uuid":"qbz_6386",
         "timestamp":"111111",
         "clientType":"1",
         "version":"1",
         "ua":"111",
         "Content-Type":"application/json",
         "env":"gMUoh3hIftoweQel/13zpABRZD2KWPaPsAwZA1BK5hcf9GoM7Q2uOd0ljXaueRGJmnvOh+rMjqxrUkXmt3xYsg==",
         "group":"Z3zqJsDTXVeldqo6C2fDcqLyy0JvHCOAujLpX8A/0T38mUlGYFQL8FNPtrjU5OZr1gZVYz3/kQ/IGqz/aWKDVQ==",
         "platform-id":"dqhngAPOWQX6DzId6uNpOJjmMF1NtbBDZd6jrXZfZPXI7kT3JasuALzur2t+f6KWDD/F3/J1mBhF7D34s+mJtQ==",
         "source":"2",
         "app-id":"111",
         "token":"+KkfE5+f+bqdRAx24KQ9CQM9sWpSvsCAwEAAQ==",
         "sign":"j1DQ++ZUaKApdhCSbyrAme6fey9uO4yN4G7PK38cxhR+lIuuIf7snif85ATiSkw==",
         "appSign":"fawtaw4t"]   */
        return ["Content-Type" : "application/json; charset=utf-8"]
    }
    
    /// 网络请求基地址
    public var baseURL: URL {
        return URL(string: "http://XXXX.com")!
    }
    
    /// 网络请求路径
    public var path: String {
        switch self {
        case .fifteenDay:
            return "/weatapi/weather/fifteenDay"
        case .seventyTwoHours:
            return "/weatapi/weatherRecordHour/seventyTwoHours"
        case .getWeatherRealTime:
            return "/weatapi/realtime/getWeatherRealTime"
        case .getPredictionQuery:
            return "/weatapi/prediction/queryIOS"
        }
    }
    
    /// 设置请求方式
    public var method: Moya.Method {
        switch self {
        case .fifteenDay:
            return .get
        case .seventyTwoHours:
            return .get
        case .getWeatherRealTime:
            return .get
        case .getPredictionQuery:
            return .get
        }
    }
    
    /// 请求参数
    public var parameters: [String: Any]? {
        switch self {
        case .fifteenDay(let value):
            return value
        case .seventyTwoHours(let value):
            return value
        case .getWeatherRealTime(let value):
            return value
        case .getPredictionQuery:
            return [:]
        }
    }
    
    /// Local data for unit test.use empty data temporarily.
    public var sampleData: Data {
        switch self {
        case .fifteenDay(let value), .seventyTwoHours(let value), .getWeatherRealTime(let value):
            return value!.jsonData()!
        case .getPredictionQuery:
            return [:].jsonData()!
        }
    }
    
    // Represents an HTTP task.
    public var task: Task {
        switch self {
        case .fifteenDay:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .seventyTwoHours:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .getWeatherRealTime:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        case .getPredictionQuery:
            return .requestParameters(parameters: parameters!, encoding: parameterEncoding)
        }
    }
    
    public var parameterEncoding: ParameterEncoding {
        // Select type of parameter encoding based on requirements.Usually we use 'URLEncoding.default'.
        switch self {
        case .fifteenDay:
            return URLEncoding.queryString
        case .seventyTwoHours:
            return URLEncoding.queryString
        case .getWeatherRealTime:
            return URLEncoding.queryString
        case .getPredictionQuery:
            return URLEncoding.queryString
        }
    }
    
    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
    
}
