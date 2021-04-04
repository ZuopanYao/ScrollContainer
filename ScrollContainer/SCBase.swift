//
//  SCBase.swift
//  SCContainer
//
//  Created by Harvey on 2021/4/4.
//

import UIKit

public struct SCBase<Base> {
    private let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

public protocol SCBaseCompatible {
    associatedtype CompatibleType
    var sc: SCBase<CompatibleType> { get }
}

extension SCBaseCompatible {
    
    public var sc: SCBase<Self> {
        return SCBase(self)
   }
}

extension UIView: SCBaseCompatible {}

extension SCBase where Base: UIView {
    
    /// 创建可滚动容器
    public func scrollable() -> SCContainer {
        return SCContainer(content: self.base)
    }
}
