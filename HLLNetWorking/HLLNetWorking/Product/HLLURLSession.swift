//
//  HLLURLSession.swift
//  HLLNetWorking
//
//  Created by  bochb on 2017/12/25.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit
import SwiftyJSON
class HLLURLSession: HLLSession {
    
     var task: URLSessionDataTask?
    
  
    
    override func session(urlString: String, method:HLLHTTPMethod, header: [String: String]?, parameter: [String: Any]?) {
        guard let url = URL(string: urlString) else { return }
        
        let sessionConfigure = URLSessionConfiguration.default
        let urlSession = URLSession(configuration: sessionConfigure, delegate: self, delegateQueue: nil)
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: HLLNetConsistance.timeout)
        request.httpMethod = method.rawValue
        if (header != nil) {
            for key in header!.keys {
                request.setValue(header![key], forHTTPHeaderField: key)
            }
        }
        if parameter != nil {
            try? request.httpBody = JSONSerialization.data(withJSONObject: parameter!, options: .prettyPrinted)
        }
      task = urlSession.dataTask(with: request)
        task?.resume()
    }
    
    override func session(urlString: String, method: HLLHTTPMethod, header: [String : String]?, parameter: [String : Any]?, response: @escaping ((Data?, URLResponse?, Error?) -> Void)) {
        guard let url = URL(string: urlString) else { return }
        
        let sessionConfigure = URLSessionConfiguration.default
        
       let urlSession = URLSession(configuration: sessionConfigure, delegate: nil, delegateQueue: nil)
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: HLLNetConsistance.timeout)
        request.httpMethod = method.rawValue
        if (header != nil) {
            for key in header!.keys {
                request.setValue(header![key], forHTTPHeaderField: key)
            }
        }
        if parameter != nil {
            try? request.httpBody = JSONSerialization.data(withJSONObject: parameter!, options: .prettyPrinted)
        }
        
       task = urlSession.dataTask(with: request) { (data, urlResponse, error) in
            response(data, urlResponse, error)
        }
        task?.resume()
    }
    
    override func cancel() {
        task?.cancel()
    }
}

extension HLLURLSession: URLSessionDataDelegate{
    
    /// <#Description#>
    ///
    /// - Parameters:
    ///   - session: <#session description#>
    ///   - dataTask: 里面包含有请求过程的各种信息,包含进度,完成百分比等
    ///   - data: <#data description#>
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        let responseProcessor = HLLNetResponseProcessor()
        responseProcessor.delegate = self.delegate
        if dataTask.error != nil {
            responseProcessor.processError(error: dataTask.error!)
        }else{
            let json = try? JSON(data: data)
            responseProcessor.processResponse(response: json?.dictionaryObject)
        }
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust{
            //服务器验证
//            let host = challenge.protectionSpace.host
            let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(.useCredential, credential)
        }else if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodClientCertificate {
            //获取客户端证书相关信息
            let identityAndTrust:IdentityAndTrust = HLLNetUtil.extractIdentity();
            
            let credential:URLCredential = URLCredential(
                identity: identityAndTrust.identityRef,
                certificates: identityAndTrust.certArray as? [AnyObject],
                persistence: URLCredential.Persistence.forSession)
            
            completionHandler(.useCredential, credential)
        }
    }
 
}


