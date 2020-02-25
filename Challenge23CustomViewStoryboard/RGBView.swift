//
//  RGBView.swift
//  Challenge23CustomViewStoryboard
//
//  Created by Herve Desrosiers on 2020-02-25.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

@IBDesignable
class RGBView: UIView {

    @IBInspectable var padding: CGFloat = 20 {
        didSet { // re-draw layout if padding changes
            setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) { // programmatic layout use case
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) { // storyboard use case
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Size of this container view
        let containerWidth = superview?.bounds.width // bounds = own coordinate system
        let containerHeight = superview?.bounds.height
        let numberOfItems: CGFloat = 3
        let itemHeight = (containerHeight! - (numberOfItems - 1) * padding) / numberOfItems
        redView.frame = CGRect(x: 0, y: 0, width: containerWidth!, height: itemHeight)
        greenView.frame = CGRect(x: 0, y: itemHeight + padding, width: containerWidth!, height: itemHeight)
        blueView.frame = CGRect(x: 0, y: (itemHeight + padding) * 2, width: containerWidth!, height: itemHeight)
    }
    
    private func setupView() {
        addSubview(redView)
        addSubview(greenView)
        addSubview(blueView)
    }
    
    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

}
