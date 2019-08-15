//
//  GeekDemonirationAPIViewModel.swift
//  GeekDataKit_Example
//
//  Created by mac on 2019/7/4.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import PromiseKit
import ObjectMapper
import CCNetwokingKit
import Moya

class GeekDemonirationAPIViewModel {
    
    private let disposeBag = DisposeBag()
    private let provider:MoyaProvider = MoyaProvider<GeekDemonirationAPI>(manager: GeekSecurityCertificationProvider.manager(), plugins: []) /// GeekRequestLoadingPlugin(), NetworkLogger()
    
    internal static let shared = GeekDemonirationAPIViewModel()
    private init() {}
    
    
    
    /*******************************************| START -趣天气天气接口- START |*************************************/
    /// 实时预告接口
    ///
    /// - Parameter value: 必填字段：areaCode
    /// - Returns: 当天数据Model
    func getWeatherRealTime(WithParameters value: [String: Any], isCache: Bool) -> Promise<GeekDataKitRealtimeResponseModel> {
        return Promise { seal in
            provider.requestJson(.getWeatherRealTime(value: value), isCache: isCache)
                .mapObject(type:GeekDataKitRealtimeResponseModel.self)
                .subscribe(onNext: { model in
                    seal.fulfill(model)
                }, onError: {
                    seal.reject($0)
                }).disposed(by: disposeBag)
        }
    }
    
    
    
}

