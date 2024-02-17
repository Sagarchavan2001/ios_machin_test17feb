//
//  secondViewController.swift
//  machineTest_Ios
//
//  Created by STC on 17/02/24.
//

import UIKit

class secondViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var insrtuctionsLabel: UILabel!
    
    @IBOutlet weak var ingredients: UILabel!
    
    var name: String?
    var ingredientsa:[String]?
    var instructions:[String]?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = name
        ingredients.text = "\(ingredientsa!)"
        insrtuctionsLabel.text = "\(instructions!)"
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
