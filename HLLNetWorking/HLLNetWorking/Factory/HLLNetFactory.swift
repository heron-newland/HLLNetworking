//
//  HLLNetFactory.swift
//  HLLNetWorking
//
//  Created by  bochb on 2017/12/25.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

/// 工厂基类, 具体实现由子类去实现, 如需拓展, 直接拓展子类, 然后在基类中添加方法
class HLLNetFactory: NSObject {

    public func urlSession() -> HLLSession? {
        return nil
    }
    
}
