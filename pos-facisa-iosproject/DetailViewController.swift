//
//  DetailViewController.swift
//  pos-facisa-iosproject
//
//  Created by user140298 on 04/06/18.
//  Copyright © 2018 Geraldo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var city : City?
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var cityLatitudeLabel: UILabel!
    
    @IBOutlet weak var cityLongitudeLabel: UILabel!
    
    @IBOutlet weak var cityPopulationLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = AppDelegate.selectedCity?.name
        cityNameLabel.text = AppDelegate.selectedCity?.name
        cityLatitudeLabel.text = AppDelegate.selectedCity?.lat
        cityLongitudeLabel.text = AppDelegate.selectedCity?.lng
        cityPopulationLabel.text = AppDelegate.selectedCity?.population.description
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
