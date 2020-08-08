//
//  CatsDataDownloader.swift
//  GenericDataLoadingAndPresenting
//
//  Created by Artur Azarau on 08.08.2020.
//  Copyright © 2020 Artur Azarau. All rights reserved.
//

final class CatsDataDownloader: DataDownloader {
    func download(data completionHandler: ([Cat]?) -> ()) {
        let cats = [
            Cat(name: "Kitty", age: 1),
            Cat(name: "Luna", age: 2),
            Cat(name: "Lucy", age: 3),
            Cat(name: "Lily", age: 4),
            Cat(name: "Bella", age: 5),
        ]
        
        completionHandler(cats)
    }
}
