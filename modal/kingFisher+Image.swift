//
//  kingFisher+Image.swift
//  machineTest_Ios
//
//  Created by STC on 17/02/24.
//

import Foundation
import Kingfisher


extension UIImageView{
    func setimage(with urlString : String){
        guard let url = URL.init(string: urlString)else{
            return
        }
        let resource = ImageResource(downloadURL: url,cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
