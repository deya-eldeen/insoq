//
//  BrandsViewController.swift
//  inSooqApp
//
//  Created by mohammad ahmad on 19/04/2021.
//

import UIKit

class BrandsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var brandsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Statics.categoyModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! SubCategoriesTableViewCell
        return cell
    }
}
