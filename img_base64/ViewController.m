//
//  ViewController.m
//  img_base64
//
//  Created by Abdullah on 25/05/1446 AH.
//

#import "ViewController.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@end

NSString *base64String;
UIImage *imageFromBase64String(NSString *base64String) {
    NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64String options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *image = [UIImage imageWithData:imageData];
    
    return image;
}


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ImageSelectedCopy.hidden = YES;
    self.Selectandopen.layer.cornerRadius = 10;
    self.Selectandopen.layer.borderWidth = 2;
    self.imagePickerController = [[UIImagePickerController alloc] init];
    self.imagePickerController.delegate = self;
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *selectedImage = info[UIImagePickerControllerOriginalImage];
    
    NSData *imageData = UIImagePNGRepresentation(selectedImage);
    
    base64String = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSLog(@"Base64 Encoded Image: %@", base64String);
    self.outPutBase64.text = base64String;
    
    self.imageBase64.image = imageFromBase64String(base64String);
    self.ImageSelectedCopy.hidden = NO;
    self.ImageSelectedCopy.layer.cornerRadius = 10;
    self.ImageSelectedCopy.layer.borderWidth = 2;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)SelectImage:(id)sender {
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (IBAction)copyBase64:(id)sender {
    UIPasteboard *copyImage = [UIPasteboard generalPasteboard];
    copyImage.string = base64String;
}
@end
