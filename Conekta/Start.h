//
//  ViewController.h
//  Conekta
//
//  Created by Jorge Jhamil Pineda Echeverria on 31/08/16.
//  Copyright © 2016 jjpe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PayPalMobile.h"

@interface Start : UIViewController<PayPalPaymentDelegate>

@property NSString *productTitle;
@property NSString *productPhoto;


@property (strong, nonatomic) IBOutlet UIImageView *imgProduct;

@property (strong, nonatomic) IBOutlet UILabel *lblProduct;


@end

