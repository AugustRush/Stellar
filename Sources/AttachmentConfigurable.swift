//
//  AttachmentConfigurable.swift
//  StellarDemo
//
//  Created by AugustRush on 6/1/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

public protocol AttachmentConfigurable: BasicChainable {
    func attachment(damping: CGFloat, frequency: CGFloat) -> AttachmentConfigurable
}