//
//  SearchResultsView.swift
//  NASA Image Search
//
//  Created by Tom Brook on 26/11/2018.
//  Copyright © 2018 Tom Brook. All rights reserved.
//

import UIKit

class SearchResultsView: UITableViewController {
    
    var presenter : SearchResultsPresenter!
    var items : [NASAImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SearchResultsPresenter(view: self)
        presenter.loadResults()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = items else {
            print("returning 0 rows")
            return 0}
        print("returning non zero item coutn")
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultsCell", for: indexPath) as! SearchResultsCell
        
        guard let items = items else {return cell}
        
        cell.titleLabel.text = items[indexPath.row].data[0].title
        cell.hrefLabel.text = items[indexPath.row].href

        return cell
    }
    

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
