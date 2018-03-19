//
//  CircleImage.swift
//  SmackApp
//
//  Created by Francois Schaus on 2/21/18.
//  Copyright © 2018 Francois Schaus. All rights reserved.
//

import UIKit

@ IBDesignable
class CircleImage: UIImageView {

    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
