//
//  ViewController.swift
//  kitchicUIKit
//
//  Created by Marian Nasturica on 09.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchNews: UITextField!
    @IBOutlet weak var newsTable: UITableView!
    
    var newsManager = NewsManager()
    
    let cellSpacingHeight: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Making a clear background for the Table View
        
        newsTable.backgroundColor = .clear
        newsTable.delegate = self
        newsTable.dataSource = self
        
        //Tapping into the search box
        
        searchNews.delegate = self
        
    }
    
}

// Creating extensions for Delegates & clean code


extension ViewController: UITextFieldDelegate{
    
    //Using the UITextFieldDelegate to create a func as an IBAction for search
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        //Dismiss keyboard upon search complete
        searchNews.endEditing(true)
        return true
    }
    
    //Checking if the user ended his search querry
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        // Checking if the search field is not empty so no null search is done
        
        if searchNews.text != "" {
            return true
        } else {
            searchNews.placeholder = "Search news"
            return false
        }
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    //Clearing the text field after searching
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        //Get a hold of the user search querry
        
        if let interest = searchNews.text{
            newsManager.getNews(searchItem: interest)
        }
        
        searchNews.text = ""
    }
    
}


extension ViewController: UITableViewDelegate {
    
    // func for debug as of now
    
    func tableView(_ newsTable: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("i've been tapped")
    }
    
}

extension ViewController: UITableViewDataSource{
    
    // Creating a func that returns a specific number of cells for the table
    
    func tableView(_ newsTable: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 30
        
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Creating the cells to populate the table
    
    func tableView(_ newsTable: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = newsTable.dequeueReusableCell(withIdentifier: "celline", for: indexPath) as! NewsCell
        
        //Customizing the cell
        
        cell.backgroundColor = UIColor.lightGray
        cell.layer.borderColor = UIColor.clear.cgColor
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        cell.title.text = "test test long long test"
        cell.title.numberOfLines = 0
        cell.title.sizeToFit()
        cell.title.padding
        cell.desc.text = "emanuel has veeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeery long description"
        cell.desc.numberOfLines = 0
        cell.desc.sizeToFit()
        cell.desc.padding
        cell.imgView.image = UIImage(named: "Star")
        
        return cell
    }
    
}

