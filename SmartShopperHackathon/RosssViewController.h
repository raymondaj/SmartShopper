//
//  RosssViewController.h
//  SmartShopperHackathon
//
//  Created by Amalraj, Raymond on 7/5/14.
//  Copyright (c) 2014 sap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RosssViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *wishListFrameView;
@property (weak, nonatomic) IBOutlet UIImageView *storesFrameView;
- (IBAction)menuButtonTouchUpInside:(id)sender;

@end
