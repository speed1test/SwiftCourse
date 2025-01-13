//
//  ViewController.swift
//  TableViews
//
//  Created by Brais Moure on 25/02/2020.
//  Copyright © 2020 MoureDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let myCountries = ["España", "Mexico", "Perú", "Colombia", "Argentina", "EEUU", "Francia", "Italia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
    }


}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Celdas simples"
        }
        return "Celdas custom"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Footer para celdas simples"
        }
        return "Footer para celdas custom"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
                cell?.backgroundColor = .gray
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.accessoryType = .disclosureIndicator
            }
            cell!.textLabel?.text = myCountries[indexPath.row]
            return cell!
        }
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyCustomTableViewCell
        
        cell?.myFirstLabel.text = String(indexPath.row + 1)
        cell!.mySecondLabel.text = myCountries[indexPath.row]
        
        if indexPath.row == 2 {
            cell!.mySecondLabel.text = "ajsldkjaklsjd kjajkjsdlk jas kajsdkl jakj akljsdkaljs kjaskdjaskj dkaljsdka jskdjaklsjdalksjdklajsdka jksjdaklj sd"
        }

        return cell!
    }
    
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        print(myCountries[indexPath.row])
    }
    
}

