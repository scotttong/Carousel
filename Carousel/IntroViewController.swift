//
//  IntroViewController.swift
//  Carousel
//
//  Created by Scott Tong on 2/10/15.
//  Copyright (c) 2015 Scott Tong. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

	@IBOutlet weak var tile6ImageView: UIImageView!
	@IBOutlet weak var tile5ImageView: UIImageView!
	@IBOutlet weak var tile4ImageView: UIImageView!
	@IBOutlet weak var tile3ImageView: UIImageView!
	@IBOutlet weak var tile2ImageView: UIImageView!
	@IBOutlet weak var tile1ImageView: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var introImageView: UIImageView!
	
	var offset: Float!
	var xOffsets : [Float] = [-30, 75, -66, 10, -200, -15]
	var yOffsets : [Float] = [-285, -240, -415, -408, -480, -500]
	var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
	var rotations : [Float] = [-10, -10, 10, 10, 10, -10]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        introScrollView.contentSize = introImageView.image!.size
        introScrollView.frame.size = self.view.frame.size
		introScrollView.contentSize = introImageView.frame.size
		
		introScrollView.delegate = self
		
		//tile 1 initial position
		tile1ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(-30), CGFloat(-285))
		tile1ImageView.transform = CGAffineTransformScale(tile1ImageView.transform, CGFloat(1), CGFloat(1))
		tile1ImageView.transform = CGAffineTransformRotate(tile1ImageView.transform, CGFloat(Double(-10) * M_PI / 180))
		
		//tile 2 initial position
		tile2ImageView.transform = CGAffineTransformMakeTranslation(CGFloat (75), CGFloat(-240))
		tile2ImageView.transform = CGAffineTransformScale(tile2ImageView.transform, CGFloat(1.65), CGFloat(1.65))
		tile2ImageView.transform = CGAffineTransformRotate(tile2ImageView.transform, CGFloat(Double(-10) * M_PI / 180))
		
		//tile 3 initial position
		tile3ImageView.transform = CGAffineTransformMakeTranslation(CGFloat (-66), CGFloat(-415))
		tile3ImageView.transform = CGAffineTransformScale(tile3ImageView.transform, CGFloat(1.7), CGFloat(1.7))
		tile3ImageView.transform = CGAffineTransformRotate(tile3ImageView.transform, CGFloat(Double(10) * M_PI / 180))
		
		//tile 4 initial position
		tile4ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(10), CGFloat(-408))
		tile4ImageView.transform = CGAffineTransformScale(tile4ImageView.transform, CGFloat(1.6), CGFloat(1.6))
		tile4ImageView.transform = CGAffineTransformRotate(tile4ImageView.transform, CGFloat(Double(10) * M_PI/180))
		
		//tile 5 initial position
		tile5ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(-200), CGFloat(-480))
		tile5ImageView.transform = CGAffineTransformScale(tile5ImageView.transform, CGFloat(1.65), CGFloat(1.65))
		tile5ImageView.transform = CGAffineTransformRotate(tile5ImageView.transform, CGFloat(Double(10) * M_PI/180))
		
		//tile 6 initial position
		tile6ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(-15), CGFloat(-500))
		tile6ImageView.transform = CGAffineTransformScale(tile6ImageView.transform, CGFloat(1.65), CGFloat(1.65))
		tile6ImageView.transform = CGAffineTransformRotate(tile6ImageView.transform, CGFloat(Double(-10) * M_PI/180))
	
	}


		
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
	
	func scrollViewDidScroll(scrollView: UIScrollView) {
		offset = Float(introScrollView.contentOffset.y)
		println("offset: \(introScrollView.contentOffset.y)")
		
		//Offset: 0-568
		//x offset: -30-0
		//y offset: -285-0
		
		var tx = convertValue(offset, 0, 568, -30, 0)
		var ty = convertValue(offset, 0, 568, -285, 0)
		var scale = convertValue(offset, 0, 568, 1, 1)
		var rotation = convertValue(offset, 0, 568, -10, 0)
		println("\(tx), \(ty), \(scale), \(rotation)")
		
		tile1ImageView.transform = CGAffineTransformMakeTranslation(CGFloat (tx), CGFloat(ty))
		tile1ImageView.transform = CGAffineTransformScale(tile1ImageView.transform, 1, 1)
		tile1ImageView.transform = CGAffineTransformRotate(tile1ImageView.transform, CGFloat(Double(rotation) * M_PI/180))

		var tx2 = convertValue(offset, 0, 568, 75, 0)
		var ty2 = convertValue(offset, 0, 568, -240, 0)
		var scale2 = convertValue(offset, 0, 568, 1.65, 1)
		var rotation2 = convertValue(offset, 0, 568, -10, 0)

		
		tile2ImageView.transform = CGAffineTransformMakeTranslation(CGFloat (tx2), CGFloat(ty2))
		tile2ImageView.transform = CGAffineTransformScale(tile2ImageView.transform, CGFloat(scale2), CGFloat(scale2))
		tile2ImageView.transform = CGAffineTransformRotate(tile2ImageView.transform, CGFloat(Double(rotation2) * M_PI / 180))

		var tx3 = convertValue(offset, 0, 568, -66, 0)
		var ty3 = convertValue(offset, 0, 568, -415, 0)
		var scale3 = convertValue(offset, 0, 568, 1.7, 1)
		var rotation3 = convertValue(offset, 0, 568, 10, 0)
		
		
		tile3ImageView.transform = CGAffineTransformMakeTranslation(CGFloat (tx3), CGFloat(ty3))
		tile3ImageView.transform = CGAffineTransformScale(tile3ImageView.transform, CGFloat(scale3), CGFloat(scale3))
		tile3ImageView.transform = CGAffineTransformRotate(tile3ImageView.transform, CGFloat(Double(rotation3) * M_PI / 180))

		var tx4 = convertValue(offset, 0, 568, xOffsets[3], 0)
		var ty4 = convertValue(offset, 0, 568, yOffsets[3], 0)
		var scale4 = convertValue(offset, 0, 568, scales[3], 1)
		var rotation4 = convertValue(offset, 0, 568, rotations[3], 0)
		
		tile4ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx4), CGFloat(ty4))
		tile4ImageView.transform = CGAffineTransformScale(tile4ImageView.transform, CGFloat(scale4), CGFloat(scale4))
		tile4ImageView.transform = CGAffineTransformRotate(tile4ImageView.transform, CGFloat(Double(rotation4) * M_PI/180))
		
		var tx5 = convertValue(offset, 0, 568, xOffsets[4], 0)
		var ty5 = convertValue(offset, 0, 568, yOffsets[4], 0)
		var scale5 = convertValue(offset, 0, 568, scales[4], 1)
		var rotation5 = convertValue(offset, 0, 568, rotations[4], 0)
		
		tile5ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx5), CGFloat(ty5))
		tile5ImageView.transform = CGAffineTransformScale(tile5ImageView.transform, CGFloat(scale5), CGFloat(scale5))
		tile5ImageView.transform = CGAffineTransformRotate(tile5ImageView.transform, CGFloat(Double(rotation5) * M_PI/180))

		var tx6 = convertValue(offset, 0, 568, xOffsets[5], 0)
		var ty6 = convertValue(offset, 0, 568, yOffsets[5], 0)
		var scale6 = convertValue(offset, 0, 568, scales[5], 1)
		var rotation6 = convertValue(offset, 0, 568, rotations[5], 0)
		
		tile6ImageView.transform = CGAffineTransformMakeTranslation(CGFloat(tx6), CGFloat(ty6))
		tile6ImageView.transform = CGAffineTransformScale(tile6ImageView.transform, CGFloat(scale6), CGFloat(scale6))
		tile6ImageView.transform = CGAffineTransformRotate(tile6ImageView.transform, CGFloat(Double(rotation6) * M_PI/180))

	}
	

		
	}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


