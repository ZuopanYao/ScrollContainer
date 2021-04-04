//
//  SCContainer.swift
//  SCContainer
//
//  Created by Harvey on 2021/4/3.
//

import UIKit

public enum SCScrollStart: Int {
    case left
    case middle
    case right
}

public class SCContainer: UIView {
    
    private let keyPath: String = "transform.translation.x"
    private var contentView: UIView!
    
    /// 滚动速度，一个必须大于1的值，越大速度越快，默认: 20.0
    public var scrollSpeed: Float = 20.0
    
    /// 滚动从哪个位置开始，默认: left
    public var scrollStart: SCScrollStart = .left
    
    /// 是否自动回退动画，默认: false
    public var autoreverses: Bool = false
    
    /// 动画重复次数，默认: 无限次
    public var repeatCount: Float = Float.greatestFiniteMagnitude
    
    /// 动画结束后，维持最后的状态，默认: false
    public var isSaveLastStatus: Bool = false
    
    /// 头尾部空隙,默认: 10.0
    public var leadAndTailGap: Float = 10.0
    
    convenience init(content: UIView) {
        self.init()
        self.contentView = content
        self.contentView.removeFromSuperview()
        
        addSubview(contentView)
        clipsToBounds = true
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.contentView.sizeToFit()
        contentView.center.y = bounds.height / 2.0
        if contentView.bounds.width < bounds.width {
            return
        }
        
        contentView.layer.removeAnimation(forKey: keyPath)
        
        let size = contentView.bounds
        var end = -size.width + bounds.width
        
        if scrollStart == .middle {
            self.contentView.frame.origin.x = bounds.width / 2.0
            end = -size.width + bounds.width / 2.0
        }else if scrollStart == .right {
            self.contentView.frame.origin.x = bounds.width
            end = -size.width
        }
        
        end = end - CGFloat(leadAndTailGap)
        
        let keyFrame = CAKeyframeAnimation(keyPath: keyPath)
        keyFrame.values = [leadAndTailGap, end]
        keyFrame.autoreverses = self.autoreverses
        
        if isSaveLastStatus {
            keyFrame.fillMode = .forwards
            keyFrame.isRemovedOnCompletion = false
            
        }
        
        if self.repeatCount > 1.0 {
            keyFrame.repeatCount = Float.greatestFiniteMagnitude
        }
        
        keyFrame.duration = Double(contentView.bounds.width) / Double(scrollSpeed)
        contentView.layer.add(keyFrame, forKey: keyPath)
    }
}
