//
//  RosssViewController.m
//  SmartShopperHackathon
//
//  Created by Amalraj, Raymond on 7/5/14.
//  Copyright (c) 2014 sap. All rights reserved.
//

#import "RosssViewController.h"

@interface RosssViewController ()

@end

@implementation RosssViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)menuButtonTouchUpInside:(id)sender {
    UIButton* selButton = (UIButton*)sender;
    switch ([sender tag]) {
            case 1:
                break;
            case 2:
                break;
            case 3:
                self.wishListFrameView.hidden = NO;
                self.storesFrameView.hidden = YES;
                break;
            case 4:
                self.wishListFrameView.hidden = YES;
                self.storesFrameView.hidden = NO;
                break;
            
            default:
                break;
        }

}
@end
