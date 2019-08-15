//
//  ViewController.swift
//  CCNetwokingKit
//
//  Created by zhangqixcu@gmail.com on 08/15/2019.
//  Copyright (c) 2019 zhangqixcu@gmail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GeekDemonirationAPIViewModel.shared.getWeatherRealTime(WithParameters: ["":""], isCache: true).done { (response) in
            /// TODO……
            
            }.catch { (error) in
                /// TODO……
                
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

