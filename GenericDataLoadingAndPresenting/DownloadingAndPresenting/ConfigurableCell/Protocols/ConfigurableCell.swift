//
//  ConfigurableCell.swift
//  GenericDataLoadingAndPresenting
//
//  Created by Artur Azarau on 08.08.2020.
//  Copyright © 2020 Artur Azarau. All rights reserved.
//

import UIKit

protocol ConfigurableCell: UITableViewCell {
    associatedtype ObjectToConfigureWith
    
    static var reuseIdentifier: String { get }
    func configure(with object: ObjectToConfigureWith)
}

extension ConfigurableCell {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
