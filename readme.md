# Verify Phone Numbers with the Swift SDK

We have recently made our first Swift SDK available for the [Sinch Verification product range](https://www.sinch.com/products/verification/). Before we dig in to the Swift parts, lets talk about verification and why you would want to do that. 

Our Verification product enables you to be sure that a user is in possession of a phone number by relying on the regular phone network to either send an SMS or by making a call. 

Why would you use our SDK instead of rolling it yourself as we have showed in previous tutorials? 

- [Rails/Android](https://www.sinch.com/tutorials/two-factor-authentication-rails/)
- [C#/iOS](https://www.sinch.com/tutorials/build-two-authentication-system/)
- [C#/Web](https://www.sinch.com/tutorials/build-two-factor-authentication-system-pt-3/)
- [Build your own magic one touch login](https://www.sinch.com/tutorials/build-authenticator-app-sinch-otp-sharp/)

## We provide some good value with our cloud SDK
1. We take care of the logic of re-tries
2. We automatically block spam numbers
3. We make sure re-tries are handled in a correct way
4. Easy to use from you mobile app, and just two simple callbacks to your backend to notify you about statuses of a verification.
5. Support for multiple ways of authentication (Just for Android at the moment, but shortly arriving for iOS)
6. Super low cost since you don't need to rent any numbers on your own. 

Lets stop talking and do some coding!

## The code
 
1. [Create an account](https://www.sinch.com/dashboard/#/signup)
2. Create an app, and change enable verification (set it to public for now) 
![enable verification](images/configureapp.png)
3. Head over to [https://github.com/sinch/ios-swift-verification](https://github.com/sinch/ios-swift-verification) to download the repo.

![screenshots](images/screenshots2.jpg)

There are some important bits to look at from a verification perspective in this app. One is the *EnterPhoneNumberViewController.swift* function:

```swift
@IBAction func startVerification(sender: AnyObject) {
    self.verification = SMSVerification(
    		applicationKey:"<yourkey>", 
    		phoneNumber: phoneNumber.text)
    self.verification!.initiate { 
    	(success: Bool, error: NSError?) 
    		-> Void in
            if (success)
            {
                self.performSegueWithIdentifier("verifySeg", sender:self)
            }
        }
    }
```
This function initiates an [SMS verification request](https://www.sinch.com/products/verification/sms-verification/) to the specified phone number (from the *viewcontroller*) and straight away gives you an indication if it’s on its way. In this case, I display an *EnterCodeViewController* and prompt the user to enter the code received in the SMS. 

```swift
@IBAction func verifyCode(sender: AnyObject) {
    verification?.verify(
    	code.text, 
    	completion: { 
    		(success:Bool, error:NSError?) -> Void in
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
```

In this super simple sample app, I just pop to the root view controller, but it gives you an idea how simple it is to integrate. 

For more information about using our Swift SDK, read about our [verification product](https://www.sinch.com/docs/verification/ios/).
