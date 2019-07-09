//
//  ViewController.swift
//  HLLNetWorking
//
//  Created by  bochb on 2017/12/25.
//  Copyright © 2017年 com.heron. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    var viewModel = HLLViewModel()

    @IBOutlet weak var ts: HLLTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ts.setViewModel(viewModel: viewModel)
    }
 
    @IBAction func loadData(_ sender: UIBarButtonItem) {
        var url:String = ""
        var method: HLLHTTPMethod = .get
        switch sender.title {
        case "Get":

            url = "https://httpbin.org/get"
//            url = "https://www.wh12333.gov.cn/publish/rbj/P1201012082118570003.shtml"
        case "Post":
            method = .post
            url = "https://httpbin.org/post"
        case "Put":
            method = .put
            url = "https://httpbin.org/put"
        case "Delete":
            method = .delete
            url = "https://httpbin.org/delete"
        case "Download":
            url = "https://httpbin.org/stream/1"
            viewModel.download(url: url)
        case "Upload":
            url = "https://httpbin.org/get"
            viewModel.upload(url: url)
        default:
            break
        }
        viewModel.getData(url: url, method:method)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

