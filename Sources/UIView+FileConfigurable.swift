//
//  UIView+FileConfigurable.swift
//  StellarDemo
//
//  Created by AugustRush on 6/7/16.
//  Copyright © 2016 August. All rights reserved.
//

import UIKit

enum ConfigurationError: ErrorType {
    case InvalidString
    case TransformedError(ErrorType)
    case Undefined
}

extension UIView {
    //configure animation with JSON string
    public func configureWithJSON(str: String) throws -> Void {
        let data = str.dataUsingEncoding(NSUTF8StringEncoding)
        guard let _ = data else {
            throw ConfigurationError.InvalidString
        }
        do {
               let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            switch json {
            case let dict as Dictionary<String,String>:
                configureWithDictionary(dict)
            default:
                throw ConfigurationError.Undefined
            }
        } catch {
            throw ConfigurationError.TransformedError(error)
        }
    }
    
    private func configureWithDictionary(dict: Dictionary<String, String>) -> Void {
        
    }
}
