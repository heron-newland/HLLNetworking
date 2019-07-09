//
//  HLLNetHeaders.swift
//  HLLNetWorking
//
//  Created by  bochb on 2018/11/14.
//  Copyright © 2018 com.heron. All rights reserved.
//

import Foundation

struct HLLNetRequestHeaders {
    /// 配置全局的请求头
    static var headers: [String: String] = [:]
    
}

struct HLLNetResponseHeader {
    
    var responseHeaders:[String :String]
    
    init(dic:[String :String] ) {
        responseHeaders = dic
        dealWithResponseHeaders()
    }
    
    /// 处理响应头, 比如存储一些信息,记录时间等等
    private func dealWithResponseHeaders(){
        
    }
}
