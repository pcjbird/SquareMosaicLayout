import Foundation

@objc public enum SquareMosaicSeparatorType: Int {
    case top, bottom, middle
}

@objc public protocol SquareMosaicBlock {
    
    func frames() -> Int
    func frames(origin: CGFloat, width: CGFloat) -> [CGRect]
}

@objc public protocol SquareMosaicPattern {
    
    func blocks() -> [SquareMosaicBlock]
    @objc optional func separator(_ type: SquareMosaicSeparatorType) -> CGFloat
}

@objc public protocol SquareMosaicSupplementary {
    
    func frame(origin: CGFloat, width: CGFloat) -> CGRect
}

@objc public protocol SquareMosaicDataSource: class {
    
    @objc optional func backgroundColor(section: Int) -> UIColor?
    @objc optional func footer(section: Int) -> SquareMosaicSupplementary?
    @objc optional func header(section: Int) -> SquareMosaicSupplementary?
    @objc func pattern(section: Int) -> SquareMosaicPattern
}

public protocol SquareMosaicDelegate: class {
    
    func layoutHeight(_ height: CGFloat) -> Void
}