//
//  SpringBehavior.swift
//  StellarDemo
//
//  Created by AugustRush on 5/16/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

class SpringBehavior {
    
    
    
    func behavior() -> UIDynamicBehavior {
        let behavior = UIDynamicBehavior()
        let gravity = UIGravityBehavior()
        let attachment = UIAttachmentBehavior()
        behavior.addChildBehavior(gravity)
        behavior.addChildBehavior(attachment)
        
        return behavior
    }
    
}
