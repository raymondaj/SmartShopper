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
    favStoreButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 0, 305, 150)];
    storeDetailsImg = [UIImage imageNamed:@"store_details"];
    [favStoreButton setBackgroundImage:storeDetailsImg forState:UIControlStateNormal];

    connectionsView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ross_content"]];
    wishListview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fav_products"]];
    favStoreview   = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"store_details"]];
    [self  addToContentView:connectionsView];
    
    
    // Do any additional setup after loading the view.
}
-(void)addToContentView:(UIView*)view
{
    [self.contentView removeFromSuperview];
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(10, 420, 300, view.frame.size.height)];//;
    [self.contentView addSubview:view];
    [self.scrollView addSubview:self.contentView];
    self.scrollView.contentSize = CGSizeMake(320, 450 + self.contentView.frame.size.height) ;

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
                [self  addToContentView:connectionsView];
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
                [self  addToContentView:wishListview];
                break;
            case 4:
                self.wishListFrameView.hidden = YES;
                self.storesFrameView.hidden = NO;
                self.favFrameView.hidden = YES;
                self.connectionFrameView.hidden = YES;
            [favStoreview setFrame:CGRectMake(10, favStoreview.frame.origin.y, 250, 150)];
                [self  addToContentView:favStoreview];
            break;
            
            default:
                break;
        }

}

- (IBAction)backButtonTouchUpInside:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
