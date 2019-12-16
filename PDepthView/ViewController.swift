//
//  ViewController.swift
//  3DTEST
//
//  Created by Robin Yu on 16/12/2019.
//  Copyright © 2019 Robin Yu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view = DepthModeView.init(frame:view.frame)
        addSwitchButton()
        addSingleView()
        addDoubleView()
    }
    
    func addSwitchButton() {
        let button = UIButton.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        button.backgroundColor = .red
        button.setTitle("2D", for: .normal)
        button.addTarget(self, action: #selector(changeThreeDimensionMode(_:)), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc func changeThreeDimensionMode(_ sender:UIButton) {
        (view as! DepthModeView).threeDimensionMode.toggle()
        sender.setTitle((view as! DepthModeView).threeDimensionMode == true ? "3D" : "2D", for: .normal)
    }
    
    func addSingleView() {
        let view1 = UIView.init(frame: .init(x: 0, y: 100, width: 100, height: 100))
        view1.center = view.center
        view1.backgroundColor = .yellow
        view1.isDepthShown = true
        view.addSubview(view1)
    }
    
    func addDoubleView() {
        let view2 = UIView.init(frame: .init(x: 0, y: 200, width: 100, height: 100))
        view2.backgroundColor = .blue
        let view3 = UIView.init(frame: .init(x: 0, y: 0, width: 50, height: 50))
        view3.isDepthShown = true
        view3.backgroundColor = .green
        view2.addSubview(view3)
        view.addSubview(view2)
    }
}
