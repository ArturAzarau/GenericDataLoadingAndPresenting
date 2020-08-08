//
//  CatConfigurableCell.swift
//  GenericDataLoadingAndPresenting
//
//  Created by Artur Azarau on 08.08.2020.
//  Copyright © 2020 Artur Azarau. All rights reserved.
//

import UIKit

final class CatConfigurableCell: UITableViewCell {}

extension CatConfigurableCell: ConfigurableCell {
    func configure(with object: Cat) {
        textLabel?.text = object.name
        detailTextLabel?.text = "\(object.age)"
    }
}
