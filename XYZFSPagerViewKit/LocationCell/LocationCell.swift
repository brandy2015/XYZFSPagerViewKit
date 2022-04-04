//
//  LocationCell.swift
//  XYZFSPagerViewKit
//
//  Created by zhangzihao on 2022/4/4.
//

import UIKit
import FSPagerView

class LocationCell: FSPagerViewCell {
    
    var DataItem:String = ""{
        didSet{
            setData()
        }
    }
    
    @IBOutlet weak var imageViewX: UIImageView! 
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var LocationDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        self.imageViewX?.layer.cornerRadius = 10
        self.imageViewX?.contentMode = .scaleAspectFill
        self.imageViewX?.clipsToBounds = true
    }
    
    func setData(){
        
        self.imageViewX?.image = UIImage(named: DataItem)
    }
}
