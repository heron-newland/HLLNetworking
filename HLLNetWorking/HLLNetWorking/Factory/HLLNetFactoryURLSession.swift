//
//  HLLNetFactoryURLSession.swift
//  HLLNetWorking
//
//  Created by  bochb on 2017/12/25.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

class HLLNetFactoryURLSession: HLLNetFactory {

    
    override func urlSession() -> HLLSession? {
          return HLLURLSession()
    }
    
}
