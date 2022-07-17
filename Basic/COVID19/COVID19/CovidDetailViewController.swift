//
//  CovidDetailViewController.swift
//  COVID19
//
//  Created by 이준복 on 2022/03/11.
//

import UIKit

class CovidDetailViewController: UITableViewController {
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!

    var covidOverView: CovidOverview?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func configureView() {
        guard let covidOverView = self.covidOverView else {return}
        self.title = covidOverView.countryName
        self.newCaseCell.detailTextLabel?.text = "\(covidOverView.newCase)명"
        self.totalCaseCell.detailTextLabel?.text = "\(covidOverView.totalCase)명"
        self.recoveredCell.detailTextLabel?.text = "\(covidOverView.recovered)명"
        self.deathCell.detailTextLabel?.text = "\(covidOverView.death)명"
        self.percentageCell.detailTextLabel?.text = "\(covidOverView.percentage)%"
        self.overseasInflowCell.detailTextLabel?.text = "\(covidOverView.newFcase)명"
        self.regionalOutbreakCell.detailTextLabel?.text = "\(covidOverView.newCcase)명"
    }
    
}
