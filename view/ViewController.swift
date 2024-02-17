//
//  ViewController.swift
//  machineTest_Ios
//
//  Created by STC on 17/02/24.
//

import UIKit

class ViewController: UIViewController {
    var receipeeArray = [Recipe]()
    
    
    @IBOutlet weak var ReceipesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reg()
        
        apireceipe {
            self.ReceipesTableView.reloadData()
        }
    }
    
    
    
    func reg(){
        let navname = UINib(nibName: "ReceipesTableViewCell", bundle: nil)
        self.ReceipesTableView.register(navname, forCellReuseIdentifier: "ReceipesTableViewCell")
    }
    func apireceipe(completed : @escaping() ->()){
        let apiUrl = "https://dummyjson.com/recipes"
        guard let url = URL(string: apiUrl) else {
            print("data not found")
            return
        }
        URLSession.shared.dataTask(with: url){ data ,  responce, error in
            if(error == nil)
            {
                do{
                    
                    let jsondecoder = JSONDecoder()
            //Mark - decoding responce..
                    let json = try! jsondecoder.decode(ReceipsApi.self, from: data!)
                    //MArk - store data in array
                    self.receipeeArray = json.recipes.self

                }catch{
                    print("error")
                }
                DispatchQueue.main.async {
                    completed()
                }
            }
            
        }.resume()
    }
}
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        receipeeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ccell = self.ReceipesTableView.dequeueReusableCell(withIdentifier: "ReceipesTableViewCell", for: indexPath)as! ReceipesTableViewCell
        for i in  receipeeArray[indexPath.row].tags{
            ccell.TagLabel.text = i
        }
        ccell.receipesImage.setimage(with:receipeeArray[indexPath.row].image )
        ccell.ratingLabel.text =  "Rating = \(String(receipeeArray[indexPath.row].rating))"
        ccell.reviewCount.text = "Review - \(String(receipeeArray[indexPath.row].reviewCount))"
        return ccell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController")as! secondViewController
        nav.name = receipeeArray[indexPath.row].name
        
        nav.instructions = receipeeArray[indexPath.row].instructions
        
        
        nav.ingredientsa = receipeeArray[indexPath.row].ingredients
        
        self.navigationController?.pushViewController(nav, animated: true)
    }
    }
    

