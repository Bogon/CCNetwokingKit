//
//  GeekDataKitRealtimeResponseModel.swift
//  GeekDataKit_Example
//
//  Created by mac on 2019/7/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import ObjectMapper

/** 实时天气返回的全数据 */
public class GeekDataKitRealtimeResponseModel: NSObject, Mappable {
    var code: Int?
    var msg: String?
    var data: [String: Any]?
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        code        <- map["code"]
        msg         <- map["msg"]
        data        <- map["data"]
    }
    
    override init() {
        super.init()
    }
    
    /**********************************|  构造数据类型：实时天气模型  |******************************/
    /** 将天气详情Json字符串转成Json */
    var weatherContentValue: [String: Any]?  {
        guard let realtimedata = data else {
            return [:]
        }
        guard let realtimeContent = realtimedata["content"]  else {
            return [:]
        }
        
        if ((realtimedata["content"] as Any) as AnyObject).isKind(of: NSArray.self) {
            return [:]
        }
//        //        if ((realtimeContent) as AnyObject).isKind(of:NSArray.self as AnyClass) {
//        //            return [:]
//        //        }
//        ///let realtimeContent: String = realtimedata["content"] as! String
//        /** 1、将数据进行base64解码 2、使用gzip进行解码，获取解码后的数据 3、将二进制数据数据转成字符串 */
//        let decodeWeatherContent: Data = GTMBase64.decode((realtimeContent as! String))!
//        let uncompressWeatherData: Data = decodeWeatherContent.gzipUncompress()
//        let weatherContentStr =  String(data: uncompressWeatherData, encoding: String.Encoding.utf8)
//        let weatherList:[String: Any] = weatherContentStr?.getDictionaryFromJSONString() as! [String : Any]
        
        //log.info("XNRealtimeInfoModel 实时天气： \(weatherList)")
        
        return realtimeContent as! [String : Any] }
    
    /** 构建实时天气模型 */
    var infoModel: JKRealtimeInfoModel? {
        guard let realtimeInfo = weatherContentValue else {
            return JKRealtimeInfoModel()
        }
        return JKRealtimeInfoModel.init(JSON: realtimeInfo)
    }
    
}

/** 实时天气返回的主要数据 */
class JKRealtimeInfoModel: NSObject, Mappable {
    /// 紫外线指数及其自然语言描述
    var life_index: [String: Any]? = ["ultraviolet": ["index": 4, "desc": "-"], "comfort": ["index": 6, "desc": "-"]]
    /// 温度
    var temperature: CGFloat? = 0
    /// 体感温度
    var apparent_temperature: CGFloat? = 0
    /// 主要天气现象
    var skycon: String? = "CLEAR_DAY"
    /// AQI（国标）
    var air_quality: [String: Any]? = [ "no2": 0, "pm25": 22, "o3": 0, "so2": 0, "pm10": 0, "aqi": ["usa": 0, "chn": 0], "description": ["usa": "", "chn": ""], "co": 0]
    /// 相对湿度
    var humidity: CGFloat? = 0
    /// 实况模块返回状态
    var status: String? = "ok"
    /// 风向，单位是度。正北方向为0度，顺时针增加到360度。风速，米制下是公里每小时
    var wind: [String: Double]? = ["speed": 0, "direction": 0]
    
    /// AQI
    var aqi: NSInteger? {
        let aqiList: [String: Any] = air_quality!["aqi"] as! [String : Any]
        let aqiValue: Int = aqiList["chn"] as! NSInteger
        return aqiValue
    }
    
    /// AQI description
    var aqi_description: String? {
        let aqiList: [String: Any] = air_quality!["description"] as! [String : Any]
        let aqiValue: String = aqiList["chn"] as! String
        return aqiValue
    }
    
    /// AQI proposal
    var proposal: String? {
        let _proposal: String = air_quality!["proposal"] == nil ? "" : (air_quality!["proposal"] as! String)
        return _proposal
    }
    
    /// 紫外线强度
    var ultraviolet: String? {
        let ultravioletList: [String: Any] = life_index!["ultraviolet"] as! [String : Any]
        let ultravioletValue: String = ultravioletList["desc"]! as! String
        return ultravioletValue
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        life_index                 <- map["life_index"]
        temperature                <- map["temperature"]
        skycon                     <- map["skycon"]
        air_quality                <- map["air_quality"]
        humidity                   <- map["humidity"]
        status                     <- map["status"]
        wind                       <- map["wind"]
        apparent_temperature       <- map["apparent_temperature"]
    }
    
    override init() {
        super.init()
    }
    
}
