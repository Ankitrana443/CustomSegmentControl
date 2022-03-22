//
//  GatePassVC.swift
//  customSegment
//
//  Created by Ankit Rana on 22/03/22.
//

import UIKit
import SnapKit
import LZViewPager
class GatePassVC: UIViewController, LZViewPagerDelegate, LZViewPagerDataSource {

    
    
    
    @IBOutlet weak var pagerView: LZViewPager!
    private var subControllers:[UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pager Demo"
        let vc1 = UIViewController.createFromNib(storyBoardId: "aViewController")
        vc1!.title = "aViewController"
        
        let vc2 = UIViewController.createFromNib(storyBoardId: "bViewController")
        vc2!.title = "bViewController    "
        
        let vc3 = UIViewController.createFromNib(storyBoardId: "cViewController")
        vc3!.title = "cViewController    "
        
        let vc4 = UIViewController.createFromNib(storyBoardId: "dViewController")
        vc4!.title = "dViewController"
        
        let vc5 = UIViewController.createFromNib(storyBoardId: "eViewController")
        vc5!.title = "eViewController"
        subControllers = [vc1!, vc2!,vc3!, vc4!,vc5!]
        pagerView.hostController = self
        pagerView.reload()
        // Do any additional setup after loading the view.
    }
    
    
    func numberOfItems() -> Int {
        return self.subControllers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
        button.setTitleColor(UIColor(red: 0/255.0, green: 84/255.0, blue: 151/255.0, alpha: 1.0), for: .selected)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)

        return button
    }
    func colorForIndicator(at index: Int) -> UIColor {
        return UIColor(red: 0/255.0, green: 84/255.0, blue: 151/255.0, alpha: 1.0)
    }
    func widthForButton(at index: Int) -> CGFloat {
        
        if index == 0{
            return 160
        }
        return 160
    }
    
    func buttonsAligment() -> ButtonsAlignment {
        return .left
    }
    
    func widthForIndicator(at index: Int) -> CGFloat {
        if index == 0{
            return 130
        }
        return 130
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
            
            super.viewWillAppear(animated)
            // CALL API
            self.navigationController?.setNavigationBarHidden(false, animated: true)
            navigationController?.navigationBar.barStyle = .default
            self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.navigationBar.tintColor = UIColor.white
            self.navigationController!.view.backgroundColor = UIColor.clear
            self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0/255.0, green: 84/255.0, blue: 151/255.0, alpha: 1.0)
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            
        }
    

}
extension UIViewController {
    static func createFromNib<T: UIViewController>(storyBoardId: String) -> T?{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: storyBoardId) as? T
    }
}
