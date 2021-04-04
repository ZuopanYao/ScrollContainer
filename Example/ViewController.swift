//
//  ViewController.swift
//  Example
//
//  Created by Harvey on 2021/4/3.
//

import UIKit
import SnapKit
import ScrollContainer

class ViewController: UIViewController {

    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "ScrollContainer 支持滚动 UILabel 文本滚动"
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.textColor = .green
        return label
    }()
    
    /// 滚动容器
    lazy var container: SCContainer = {
        
        let container = label.sc.scrollable()
        view.addSubview(container)
        
        container.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }

        container.backgroundColor = .purple
        
        /// 滚动速度，一个必须大于1的值，越大速度越快，默认: 20.0
        container.scrollSpeed = 40.0
        
        /// 是否自动回退动画，默认: false
        container.autoreverses = true
        
        /// 滚动从哪个位置开始，默认: left
        //container.scrollStart = .left
        
        /// 动画结束后，维持最后的状态，默认: false
        //container.isSaveLastStatus = false
        
        /// 头尾部空隙,默认: 10.0
        //container.leadAndTailGap = 10.0
        
        /// 动画重复次数，默认: 无限次
        //container.repeatCount = Float.greatestFiniteMagnitude
        
        return container
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /// 标志需要刷新，这是必须的
        container.setNeedsLayout()
    }
}

