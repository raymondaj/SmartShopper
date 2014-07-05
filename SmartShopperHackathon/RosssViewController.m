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
    favStoreButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 305, 200)];
    storeDetailsImg = [UIImage imageNamed:@"store_details"];
//    [self.contentView removeFromSuperview];
    [favStoreButton setImage:storeDetailsImg forState:UIControlStateNormal];
    [self.contentView addSubview:favStoreButton];
    [self.scrollView addSubview:self.contentView];
    self.scrollView.contentSize = CGSizeMake(320, 350 + self.contentView.frame.size.height) ;
    
    
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
    [self.contentView removeFromSuperview];
    switch ([sender tag]) {
            case 1:
                self.wishListFrameView.hidden = YES;
                self.storesFrameView.hidden = YES;
                self.favFrameView.hidden = YES;
                self.connectionFrameView.hidden = NO;
                break;
            case 2:
                self.wishListFrameView.hidden = YES;
                self.storesFrameView.hidden = YES;
                self.favFrameView.hidden = NO;
                self.connectionFrameView.hidden = YES;
                break;
            case 3:
                self.wishListFrameView.hidden = NO;
                self.storesFrameView.hidden = YES;
                self.favFrameView.hidden = YES;
                self.connectionFrameView.hidden = YES;
                break;
            case 4:
                self.wishListFrameView.hidden = YES;
                self.storesFrameView.hidden = NO;
                self.favFrameView.hidden = YES;
                self.connectionFrameView.hidden = YES;
                [self.scrollView addSubview:self.contentView];
//            self.scrollView.contentSize = CGSizeMake(320, 350 + self.contentView.frame.size.height) ;            
            break;
            
            default:
                break;
        }

}

- (IBAction)backButtonTouchUpInside:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
