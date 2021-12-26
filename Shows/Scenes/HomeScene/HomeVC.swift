//
//  ViewController.swift
//  Shows
//
//  Created by eslam dweeb on 25/12/2021.
//

import UIKit

class HomeVC: UIViewController {
    //MARK:- UI Components
    lazy var tableView:UITableView = {
        let table = UITableView()
//        table.register(ProductCell.self, forCellReuseIdentifier: ProductCell.getIdentifier())
        table.separatorStyle = .none
//        table.delegate = self
//        table.dataSource = self
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }


}

