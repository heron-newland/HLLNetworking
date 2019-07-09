//
//  HLLTextView.swift
//  HLLNetWorking
//
//  Created by  bochb on 2018/11/13.
//  Copyright © 2018 com.heron. All rights reserved.
//

import UIKit
import SwiftyJSON
class HLLTextView: UITextView {

    var viewModel:HLLViewModel = HLLViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setViewModel(viewModel:HLLViewModel) {
        self.viewModel = viewModel
        self.viewModel.addObserver(self, forKeyPath: "result", options: .new, context: nil)
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        let value = change?[ NSKeyValueChangeKey.newKey] as? [String: Any]
        guard let result = value else { return }
        text = "\(result)"
    }
    
    deinit {
        self.viewModel.removeObserver(self, forKeyPath:  "result")
    }
}
