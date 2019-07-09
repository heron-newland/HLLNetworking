//
//  HLLNetConsistance.swift
//  HLLNetWorking
//
//  Created by  bochb on 2018/11/13.
//  Copyright © 2018 com.heron. All rights reserved.
//

import UIKit

class HLLNetConsistance: NSObject {
    //HLLAlamofireSession
    //HLLURLSession
    //HLLAFNSession
      static  let netFactoryName = "HLLURLSession"
    
        static let baseURL = ""
    
    /// 服务器证书
    static let serveCerPath =  Bundle.main.path(forResource: "xxx", ofType: "cer")!
    ///客户端证书
    static let clientCerPath = Bundle.main.path(forResource: "xxx", ofType: "p12")!
    
    static let timeout: TimeInterval = 12.0
}
