
//
//  HLLNetResponseProcessor.swift
//  HLLNetWorking
//
//  Created by  bochb on 2018/11/13.
//  Copyright © 2018 com.heron. All rights reserved.
//

import UIKit

class HLLNetResponseProcessor: NSObject{

    var delegate: HLLURLProtocol?
    func processResponse(response: [String:Any]?) -> Void {
        guard let result = response else { return }
        debugPrint(result)
        delegate?.response?(result: result)
    }
    
//    func async(response: [String:Any]?) -> Void {
//        DispatchQueue.main.async {
//            self.processResponse(response: response)
//        }
//    }
//    
    
    func processError(error:Error) -> Void {
        debugPrint(error.localizedDescription)
        delegate?.error?(error: error)
    }
    
    
}
