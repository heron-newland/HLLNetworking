//
//  HLLNetManager.swift
//  HLLNetWorking
//
//  Created by  bochb on 2018/11/14.
//  Copyright © 2018 com.heron. All rights reserved.
//

import UIKit

class HLLNetManager: NSObject {
    /// 根据字符串生成类,在HLLNetConsistance配置网络请求的类名,生成对应的类
    ///
    /// - Parameter className: 类名
    /// - Returns: 类名对应的类
    static  func manager() -> HLLSession? {
        guard let spaceName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
            debugPrint("命名空间不存在")
            return nil
        }
        // 2.通过命名空间和类名转换成类
        let classType : AnyClass? = NSClassFromString((spaceName as! String) + "." + HLLNetConsistance.netFactoryName)
        
        guard let classFromString = classType as? HLLSession.Type else { return nil}
        let session =  classFromString.init()
        return session
    }
}
