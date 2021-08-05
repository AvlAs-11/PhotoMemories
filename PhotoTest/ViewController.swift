//
//  ViewController.swift
//  PhotoTest
//
//  Created by Pavel Avlasov on 30.07.2021.
//

import UIKit

class MainViewController: UIViewController  {
    
    @IBOutlet weak var locationNameField: UITextField!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var locationTableView: UITableView!
    
    let defaultName = "Name"
    var nameOflocationArray = ["Streets", "Cars", "Works"]
    
    let addCellLocationButton = PlusButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCellLocationButton.addTarget(self, action: #selector(addNewCell), for: .touchUpInside)
        locationNameField.textColor = .lightGray
        locationNameField.delegate = self
        tableViewConfig()
        addCellLocationButton.setupAnchors(view: self.view)
        view.addSubview(addCellLocationButton)
    }
    
    @objc func addNewCell() {
        nameOflocationArray.append(defaultName)
        locationTableView.reloadData()
    }
    
    private func tableViewConfig() {
        //1.
        let nib = UINib(nibName: "PlaceTableViewCell", bundle: nil)
        locationTableView.register(nib, forCellReuseIdentifier: "PlaceTableViewCell")
        //2. Выставляешь источник для данных и методы делегатов для таблицы
        locationTableView.delegate = self
        locationTableView.dataSource = self
        
        locationTableView.reloadData()
        
        locationTableView.estimatedRowHeight = 100
        //locationTableView.layer.cornerRadius = 20
        locationTableView.rowHeight = UITableView.automaticDimension
        
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOflocationArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceTableViewCell", for: indexPath) as! PlaceTableViewCell
        cell.configure(text: nameOflocationArray[indexPath.row])
        cell.needUpdate = {
            tableView.beginUpdates()
            cell.imagesCollectionView.layoutIfNeeded()
            cell.imagesCollectionView.reloadData()
            cell.frame = tableView.bounds
                    cell.layoutIfNeeded()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = self.delete(rowIndexPathAt: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
    
    func delete(rowIndexPathAt indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, _) in
            guard let self = self else {return}
            self.nameOflocationArray.remove(at: Int(indexPath.row))
            self.locationTableView.deleteRows(at: [indexPath], with: .automatic)
            self.locationTableView.reloadData()
        }
        return action
    }
    
}

extension MainViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text == "" {
            textField.text = "Without name"
            textField.textColor = .lightGray
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Without name" {
            textField.text = ""
            textField.textColor = .black
        }
    }
}
