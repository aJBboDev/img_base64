//
//  ViewController.h
//  img_base64
//
//  Created by Abdullah on 25/05/1446 AH.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)SelectImage:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *outPutBase64;
@property (weak, nonatomic) IBOutlet UIImageView *imageBase64;
@property (weak, nonatomic) IBOutlet UIButton *Selectandopen;
- (IBAction)copyBase64:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *ImageSelectedCopy;



@end

