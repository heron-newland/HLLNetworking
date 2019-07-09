//
//  HLLViewModel.swift
//  HLLNetWorking
//
//  Created by  bochb on 2018/11/13.
//  Copyright © 2018 com.heron. All rights reserved.
//

import UIKit
import SwiftyJSON
class HLLViewModel: NSObject,HLLURLProtocol {

    @objc dynamic var result:[String: Any] = [:]
    
    func getData(url: String, method: HLLHTTPMethod) -> Void {
        let netManager =  HLLNetManager.manager()
        netManager?.session(urlString: url, method: method, header: nil, parameter: nil, response: { (data, urlReponse, error) in
            DispatchQueue.main.async {
                
                let json = try? JSON(data: data!)
                self.result = json?.dictionaryValue ?? [:]
            }
          
        })
//        netManager?.delegate = self
//        netManager?.session(urlString: url, method: method, header: nil, parameter: nil)
    }
    
    func response(result: [String : Any]) {
        DispatchQueue.main.async {
            self.result = result
        }
    }
    func error(error: Error) {
        //error
    }
    
    func download(url: String) -> Void {
        
    }
    
    func upload(url: String) -> Void {
        
    }
}
