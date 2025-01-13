//
//  GreenViewController.swift
//  ViewsAndNavigationControls
//
//  Created by Brais Moure on 06/01/2020.
//  Copyright © 2020 MoureDev. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController {

    @IBOutlet weak var mySearchBar: UISearchBar!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myLabel.isHidden = true
        
        mySearchBar.delegate = self
    }

}

extension GreenViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        mySearchBar.resignFirstResponder()
        
        myLabel.text = mySearchBar.text
        myLabel.isHidden = false
    }
    
}
