//
//  VerifyCodeViewController.swift
//  SwiftVerification
//
//  Created by christian jensen on 6/1/15.
//  Copyright (c) 2015 christian jensen. All rights reserved.
//

import UIKit
import SinchVerification;

class VerifyCodeViewController: UIViewController {
    var verification:Verification?
    
    @IBOutlet weak var code: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        self.code.becomeFirstResponder();
    }
    
    @IBAction func verifyCode(sender: AnyObject) {
        verification?.verify(code.text, completion: { (success:Bool, error:NSError?) -> Void in
            if (success)
            {
                    self.navigationController?.popToRootViewControllerAnimated(true)
                
            }
            else
            {
                //display some error message here
            }
            
        })
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
