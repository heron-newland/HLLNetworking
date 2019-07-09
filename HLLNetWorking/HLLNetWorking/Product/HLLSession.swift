//
//  HLLSession.swift
//  HLLNetWorking
//
//  Created by  bochb on 2017/12/25.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit
public enum HLLHTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

class HLLSession: NSObject {
    
    var delegate: HLLURLProtocol?
    
    required override init() {
        super.init()
    }

    /// 通过代理获取请求结果
    func session(urlString: String, method:HLLHTTPMethod, header: [String: String]?, parameter: [String: Any]?){}
    ///通过闭包获取请求结果
    func session(urlString: String, method:HLLHTTPMethod, header: [String: String]?, parameter: [String: Any]?, response:(@escaping (Data?, URLResponse?, Error?) -> Void)){}
    
    func cancel() {}
}


//定义一个结构体，存储认证相关信息
struct IdentityAndTrust {
    var identityRef:SecIdentity
    var trust:SecTrust
    var certArray:AnyObject
}
