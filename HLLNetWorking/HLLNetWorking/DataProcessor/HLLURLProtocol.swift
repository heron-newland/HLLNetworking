//
//  HLLURLProtocol.swift
//  HLLNetWorking
//
//  Created by  bochb on 2017/12/25.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit

@objc public protocol HLLURLProtocol: NSObjectProtocol {
    //请求结果
    @objc optional func response(result: [String: Any])
    //错误
    @objc optional func error(error: Error)

    //异步暂未实现
    @objc optional func async_response(result: [String: Any])
    @objc optional func async_error(error: Error)
}
