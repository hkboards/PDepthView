//
//  DepthModeView.swift
//  3DTEST
//
//  Created by Robin Yu on 16/12/2019.
//  Copyright © 2019 Robin Yu. All rights reserved.
//

import UIKit

class DepthModeView: UIView {
    
    var threeDimensionMode:Bool {
        get {
            return Cache.temp.threeDimensionMode
        }
        set {
            Cache.temp.threeDimensionMode = newValue
            switchMode()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.anchorPoint = .zero
        let depthView = UIView.init(frame: frame.offsetBy(dx: frame.width, dy: 0))
        depthView.backgroundColor = .init(white: 0.5, alpha: 1.0)
        addSubview(depthView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getActionItemsOfView(view:UIView) -> [UIView] {
        var actionItems = [UIView]()
        for subview in view.subviews {
            actionItems += getActionItemsOfView(view: subview)
            if subview.isDepthShown == true {
                actionItems.append(subview)
            }
        }
        return actionItems
    }
    
    func switchMode() {
        if threeDimensionMode == true {
            for actionItem in getActionItemsOfView(view: self) {
                let globalFrame = actionItem.convert(actionItem.bounds, to: self)
                let itemDepthView = UIView.init(frame: globalFrame.offsetBy(dx: frame.width, dy: 0))
                itemDepthView.tag = 999
                let colorOverlayView = UIView.init(frame: .init(origin: .zero, size: itemDepthView.frame.size))
                colorOverlayView.backgroundColor = .init(white: 0.8, alpha: 1.0)
                itemDepthView.addSubview(colorOverlayView)
                addSubview(itemDepthView)
            }
            transform = CGAffineTransform(scaleX: 0.5, y: 1)
        }else{
            for subview in subviews where tag == 999 {
                subview.removeFromSuperview()
            }
            transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
}

