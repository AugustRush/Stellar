//
//  UIView+FileConfigurable.swift
//  StellarDemo
//
//  Created by AugustRush on 6/7/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum ConfigurationError: Error {
    case invalidString
    case transformedError(Error)
    case undefined
}

extension UIView {
    //configure animation with JSON string
    public func configureWithJSON(_ str: String) throws -> Void {
        let data = str.data(using: String.Encoding.utf8)
        guard let _ = data else {
            throw ConfigurationError.invalidString
        }
        do {
               let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            switch json {
            case let dict as Dictionary<String,String>:
                configureWithDictionary(dict)
            default:
                throw ConfigurationError.undefined
            }
        } catch {
            throw ConfigurationError.transformedError(error)
        }
    }
    
    fileprivate func configureWithDictionary(_ dict: Dictionary<String, String>) -> Void {
        
    }
}
