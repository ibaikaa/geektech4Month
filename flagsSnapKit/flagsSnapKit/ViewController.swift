//
//  ViewController.swift
//  flagsSnapKit
//
//  Created by ibaikaa on 2/11/22.
//

import UIKit

import SnapKit



extension UIView{
    
    func alignRectanglesWidthToEdges(mainView: UIView){
        self.snp.makeConstraints{ make in
            make.left.equalTo(mainView.snp.left)
            make.right.equalTo(mainView.snp.right)
        }
    }
}


class ViewController: UIViewController, UIScrollViewDelegate{
    
    
    func createView(_ backgroundColor: UIColor) -> UIView{
        let view = UIView()
        view.backgroundColor = backgroundColor
        return view
    }
    
    
    
    //adding scrollView to make VC scrollable
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.delegate = self
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 2000)
        return scroll
    }()
    
    
    //for India flag
    private lazy var indianFlagTopOrangeRectangle: UIView = {
        createView(.orange)
    }()
    private lazy var indianFlagCenterWhiteRectangle: UIView = {
        createView(.white)
    }()
    private lazy var indianFlagCenterCircle: UIView = {
        createView(.orange)
    }()
    private lazy var indianFlagBottomGreenRectangle: UIView = {
        createView(.systemGreen)
    }()
    
    let circleHeight: CGFloat = 50.0
    
    
    //for Georgia flag
    private lazy var georgianFlagBackgroundWhiteRectangle: UIView = {
        createView(.white)
    }()

    private lazy var georgianFlagCenterBigRectangleHorizontal: UIView = {
        createView(.red)
    }()

    private lazy var georgianFlagCenterBigRectangleVertical: UIView = {
        createView(.red)
    }()

    private lazy var georgianFlagRedRectangleTopLeftHorizontal: UIView = {
        createView(.red)
    }()

    private lazy var georgianFlagRedRectangleTopLeftVertical: UIView = {
        createView(.red)
    }()
    
    private lazy var georgianFlagRedRectangleTopRightHorizontal: UIView = {
        createView(.red)
    }()

    private lazy var georgianFlagRedRectangleTopRightVertical: UIView = {
        createView(.red)
    }()
    
    private lazy var georgianFlagRedRectangleBottomLeftHorizontal: UIView = {
        createView(.red)
    }()

    private lazy var georgianFlagRedRectangleBottomLeftVertical: UIView = {
        createView(.red)
    }()
    
    
    private lazy var georgianFlagRedRectangleBottomRightHorizontal: UIView = {
        createView(.red)
    }()

    private lazy var georgianFlagRedRectangleBottomRightVertical: UIView = {
        createView(.red)
    }()
    
    
    //for Malta flag
    
    private lazy var maltaFlagWhiteLeftRectangle: UIView = {
        createView(.white)
    }()
    
    private lazy var maltaFlagRedRightRectangle: UIView = {
        createView(.red)
    }()
    
    private lazy var maltaFlagHorizontalCrossPart: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    
    private lazy var maltaFlagVerticalCrossPart: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.red.cgColor
        return view
    }()
    
    
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        view.addSubview(scrollView)
        setupIndiaFlag()
        setupGeorgiaFlag()
        setupMaltaFlag()
    }
    
    
    override func viewWillLayoutSubviews() {
        
        super.viewDidLayoutSubviews()

        //making india circle circular
        self.indianFlagCenterCircle.layer.cornerRadius = circleHeight / 2
        
        //making scrollview active
        let layout = view.safeAreaLayoutGuide
        scrollView.centerXAnchor.constraint(equalTo: layout.centerXAnchor).isActive = true
        scrollView.centerYAnchor.constraint(equalTo: layout.centerYAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: layout.widthAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: layout.heightAnchor).isActive = true
    }
    
    
    func setupIndiaFlag(){
        
        scrollView.addSubview(indianFlagTopOrangeRectangle)
        scrollView.addSubview(indianFlagCenterWhiteRectangle)
        scrollView.addSubview(indianFlagCenterCircle)
        scrollView.addSubview(indianFlagBottomGreenRectangle)

        //making orange rectangle
        indianFlagTopOrangeRectangle.alignRectanglesWidthToEdges(mainView: view)
        indianFlagTopOrangeRectangle.snp.makeConstraints { make in
            make.height.top.equalTo(100)
        }
        
        
        //making white rectangle
        indianFlagCenterWhiteRectangle.alignRectanglesWidthToEdges(mainView: view)
        indianFlagCenterWhiteRectangle.snp.makeConstraints{ make in
            make.top.equalTo(indianFlagTopOrangeRectangle.snp.bottom)
            make.height.equalTo(100)
        }
        
        //making orange circle in the center of flag
        indianFlagCenterCircle.snp.makeConstraints{ make in
            make.center.equalTo(indianFlagCenterWhiteRectangle.snp.center)
            make.width.height.equalTo(self.circleHeight)
        }
        
        //making green rectangle
        indianFlagBottomGreenRectangle.alignRectanglesWidthToEdges(mainView: view)
        indianFlagBottomGreenRectangle.snp.makeConstraints{ make in
            make.top.equalTo(indianFlagCenterWhiteRectangle.snp.bottom)
            make.height.equalTo(100)
        }
    }
    
    func setupGeorgiaFlag(){
        
        //making background rectangle
        scrollView.addSubview(georgianFlagBackgroundWhiteRectangle)
        
        scrollView.addSubview(georgianFlagCenterBigRectangleHorizontal)
        scrollView.addSubview(georgianFlagCenterBigRectangleVertical)
        
        scrollView.addSubview(georgianFlagRedRectangleTopLeftHorizontal)
        scrollView.addSubview(georgianFlagRedRectangleTopLeftVertical)
        
        scrollView.addSubview(georgianFlagRedRectangleTopRightHorizontal)
        scrollView.addSubview(georgianFlagRedRectangleTopRightVertical)
        
        scrollView.addSubview(georgianFlagRedRectangleBottomLeftHorizontal)
        scrollView.addSubview(georgianFlagRedRectangleBottomLeftVertical)
        
        scrollView.addSubview(georgianFlagRedRectangleBottomRightHorizontal)
        scrollView.addSubview(georgianFlagRedRectangleBottomRightVertical)
        
        


        georgianFlagBackgroundWhiteRectangle.alignRectanglesWidthToEdges(mainView: view)
        
        georgianFlagBackgroundWhiteRectangle.snp.makeConstraints{ make in
            make.top.equalTo(indianFlagBottomGreenRectangle.snp.bottom).offset(150)
            make.height.width.equalTo(300)
        }
    
        
        //CENTER CROSS
        //making horizontal big red rectangle (center cross 1/2)
        georgianFlagCenterBigRectangleHorizontal.alignRectanglesWidthToEdges(mainView: view)
        georgianFlagCenterBigRectangleHorizontal.snp.makeConstraints{ make in
            make.center.equalTo(georgianFlagBackgroundWhiteRectangle)
            make.height.equalTo(60)
        }
        
        //making vertical big red rectangle (center cross 2/2)
        georgianFlagCenterBigRectangleVertical.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.top)
            make.bottom.equalTo(georgianFlagBackgroundWhiteRectangle.snp.bottom)
            make.center.equalTo(georgianFlagBackgroundWhiteRectangle)
            make.width.equalTo(60)
        }
        
        
        //TOP LEFT CROSS
        //making horizontal top left rectangle (top left cross 1/2)
        georgianFlagRedRectangleTopLeftHorizontal.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.top).offset(50)
            make.left.equalTo(georgianFlagBackgroundWhiteRectangle.snp.left).offset(50)
            make.right.equalTo(georgianFlagBackgroundWhiteRectangle.snp.right).offset(-280)
            make.height.equalTo(20)
        }
        
        
        //making vertical top left rectangle (top left cross 2/2)
        georgianFlagRedRectangleTopLeftVertical.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.top).offset(30)
            make.bottom.equalTo(georgianFlagBackgroundWhiteRectangle.snp.bottom).offset(-210)
            make.left.equalTo(georgianFlagBackgroundWhiteRectangle.snp.left).offset(70)
            make.width.equalTo(20)
        }
        
        
        //TOP RIGHT CROSS
        //making horizontal top right rectangle (top right cross 1/2)
        georgianFlagRedRectangleTopRightHorizontal.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.top).offset(50)
            make.right.equalTo(georgianFlagBackgroundWhiteRectangle.snp.right).offset(-50)
            make.left.equalTo(georgianFlagBackgroundWhiteRectangle.snp.left).offset(280)
            make.height.equalTo(20)
        }
        
        //making vertical top right rectangle (top right cross 2/2)
        georgianFlagRedRectangleTopRightVertical.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.top).offset(30)
            make.bottom.equalTo(georgianFlagBackgroundWhiteRectangle.snp.bottom).offset(-210)
            make.right.equalTo(georgianFlagBackgroundWhiteRectangle.snp.right).offset(-70)
            make.width.equalTo(20)
        }
        
        
        
        //BOTTOM LEFT CROSS
        //making horizontal bottom left rectangle (bottom left cross 1/2)
        georgianFlagRedRectangleBottomLeftHorizontal.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.top).offset(230)
            make.left.equalTo(georgianFlagBackgroundWhiteRectangle.snp.left).offset(50)
            make.right.equalTo(georgianFlagBackgroundWhiteRectangle.snp.right).offset(-280)
            make.height.equalTo(20)
        }
        
        //making vertical bottom left rectangle (bottom left cross 2/2)
        georgianFlagRedRectangleBottomLeftVertical.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.top).offset(210)
            make.left.equalTo(georgianFlagBackgroundWhiteRectangle.snp.left).offset(70)
            make.bottom.equalTo(georgianFlagBackgroundWhiteRectangle.snp.bottom).offset(-30)
            make.width.equalTo(20)
        }
        
        
        
        //BOTTOM RIGHT CROSS
        //making horizontal bottom right rectangle (bottom right cross 1/2)
        georgianFlagRedRectangleBottomRightHorizontal.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.top).offset(230)
            make.bottom.equalTo(georgianFlagRedRectangleBottomRightHorizontal.snp.bottom).offset(-30)
            make.right.equalTo(georgianFlagBackgroundWhiteRectangle.snp.right).offset(-50)
            make.left.equalTo(georgianFlagBackgroundWhiteRectangle.snp.left).offset(280)
            make.height.equalTo(20)
        }
        
        //making vertical bottom right rectangle (bottom right cross 1/2)
        georgianFlagRedRectangleBottomRightVertical.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.top).offset(210)
            make.bottom.equalTo(georgianFlagBackgroundWhiteRectangle.snp.bottom).offset(-30)
            make.right.equalTo(georgianFlagBackgroundWhiteRectangle.snp.right).offset(-70)
            make.width.equalTo(20)
        }
    }
    
    func setupMaltaFlag(){
        scrollView.addSubview(maltaFlagWhiteLeftRectangle)
        scrollView.addSubview(maltaFlagRedRightRectangle)
        scrollView.addSubview(maltaFlagHorizontalCrossPart)
        scrollView.addSubview(maltaFlagVerticalCrossPart)
        
        maltaFlagWhiteLeftRectangle.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.bottom).offset(150)
            make.left.equalTo(view.snp.left)
            make.width.equalTo(200)
            make.height.equalTo(300)
        }
        
        maltaFlagRedRightRectangle.snp.makeConstraints{ make in
            make.top.equalTo(georgianFlagBackgroundWhiteRectangle.snp.bottom).offset(150)
            make.right.equalTo(view.snp.right)
            make.width.equalTo(200)
            make.height.equalTo(300)
        }
        
        maltaFlagHorizontalCrossPart.snp.makeConstraints{ make in
            make.top.equalTo(maltaFlagWhiteLeftRectangle.snp.top).offset(30)
            make.left.equalTo(maltaFlagWhiteLeftRectangle.snp.left).offset(20)
            make.right.equalTo(maltaFlagWhiteLeftRectangle.snp.right).offset(-130)
            make.height.equalTo(20)
        }
        
        maltaFlagVerticalCrossPart.snp.makeConstraints{ make in
            make.top.equalTo(maltaFlagRedRightRectangle.snp.top).offset(15)
            make.bottom.equalTo(maltaFlagWhiteLeftRectangle.snp.bottom).offset(-235)
            make.left.equalTo(maltaFlagWhiteLeftRectangle.snp.left).offset(35)
            make.width.equalTo(20)
            
        }
        
    }

}

