//
//  ViewController.swift
//  XYZFSPagerViewKit
//
//  Created by zhangzihao on 2022/4/3.
//

import UIKit
import FSPagerView

class ViewController: UIViewController {
    fileprivate let imageNames = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"]
    fileprivate let transformerNames = ["cross fading", "zoom out", "depth", "linear", "overlap", "ferris wheel", "inverted ferris wheel", "coverflow", "cubic"]
    
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            
            self.pagerView.register(LocationCell.self, forCellWithReuseIdentifier: "\(LocationCell.self)")
            self.pagerView.register(UINib(nibName: "\(LocationCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(LocationCell.self)")
            

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pagerView.dataSource = self
        self.pagerView.delegate = self
        self.pagerView.transformer = FSPagerViewTransformer(type:.linear)
        self.pagerView.itemSize = CGSize(width: self.pagerView.frame.width * 0.8, height: self.pagerView.frame.height * 0.8)
        self.pagerView.interitemSpacing = 20
    }


}

extension ViewController:FSPagerViewDataSource,FSPagerViewDelegate {
   
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return imageNames.count
    }
    
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier:"\(LocationCell.self)", at: index) as! LocationCell
        cell.imageViewX?.image = UIImage(named: self.imageNames[index])
        cell.imageViewX?.contentMode = .scaleAspectFill
        cell.imageViewX?.clipsToBounds = true
//        cell.imageView?.layer.cornerRadius = 10
        
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    
}
