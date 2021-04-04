# ScrollContainer

可滚动容器，支持 UILabel 文本滚动(跑马灯效果)等，常规情况下，UIView 的子类都可以

[![Platform](https://img.shields.io/cocoapods/p/ScrollContainer.svg?style=flat)](https://github.com/ZuopanYao/ScrollContainer)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/ScrollContainer.svg)](https://cocoapods.org/pods/ScrollContainer)

## Requirements / 使用条件

- iOS 11.0+ 
- Xcode 12.2+
- Swift 5.0+


## Installation / 安装

### CocoaPods

```
pod 'ScrollContainer'
```

### Manually / 手动安装

If you prefer not to use either of the aforementioned dependency managers, you can integrate SnapKit into your project manually.

如果您不喜欢以上管理依赖库的方式，则可以手动将 ScrollContainer 集成到项目中。


## Usage / 使用
```
let container = yourLabel.sc.scrollable()
view.addSubview(container)
    
container.snp.makeConstraints { (make) in
    make.top.equalToSuperview().offset(100)
    make.left.equalToSuperview().offset(30)
    make.width.equalTo(200)
    make.height.equalTo(40)
}
    
/// 滚动速度，一个必须大于1的值，越大速度越快，默认: 20.0
container.scrollSpeed = 20.0
    
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


/// 当你需要启动动画时，标志需要刷新，这是必须的
/// 如里是在控制器，建议在 viewDidAppear 方法里调用
// container.setNeedsLayout()
```

## License / 许可证

ScrollContainer is released under the MIT license. See LICENSE for details.

ScrollContainer 是在 MIT 许可下发布的，有关详情请查看该许可证。