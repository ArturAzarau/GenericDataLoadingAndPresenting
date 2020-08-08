//
//  ViewController.swift
//  GenericDataLoadingAndPresenting
//
//  Created by Artur Azarau on 08.08.2020.
//  Copyright © 2020 Artur Azarau. All rights reserved.
//

import UIKit

class GenericDataLoadingAndPresentingController<DataDownloaderType: DataDownloader, CellType: ConfigurableCell>: UITableViewController
where DataDownloaderType.ObjectToDownload == CellType.ObjectToConfigureWith {
    
    let dataDownloader: DataDownloaderType
    private(set) var objectsToPresent = [DataDownloaderType.ObjectToDownload]()
    
    init(dataDownloader: DataDownloaderType) {
        self.dataDownloader = dataDownloader
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CellType.self, forCellReuseIdentifier: CellType.reuseIdentifier)
        startLoadingData()
    }
    
    func startLoadingData() {
        dataDownloader.download { [weak self] objects in
            guard let objects = objects, let self = self else {
                return
            }
            
            self.objectsToPresent = objects
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectsToPresent.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellType.reuseIdentifier,
                                                       for: indexPath) as? CellType else {
            return UITableViewCell()
        }
        
        cell.configure(with: objectsToPresent[indexPath.row])
        return cell
    }
}

