//
//  OfferDetailViewController.m
//  SmartShopperHackathon
//
//  Created by Amalraj, Raymond on 7/5/14.
//  Copyright (c) 2014 sap. All rights reserved.
//

#import "OfferDetailViewController.h"
#import "MOLoginViewController.h"
#import "MyOrder.h"
#import "MOProgressHUD.h"
#import "MORegisterViewController.h"
#import "MOTransactionViewController.h"
#import "MOOrder.h"
#import "UIColor+MOAppearance.h"
#import "MOProvidersViewController.h"
#import "MOIdealTransaction.h"


@interface OfferDetailViewController ()

@end

@implementation OfferDetailViewController

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
    
    [self.view bringSubviewToFront:self.backButton];
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

- (IBAction)addToCart:(id)sender {
    MOOrder *order = [MOOrder new];
    order.externalOrderId = @"123456";
    [order addItemWithName:@"CLIC Necklace" price:84.75 quantity:1];
    [order addItemWithName:@"CLIC 011 Earrings" price:54.75 quantity:1];
    
    //Generic way to start payments
    UIViewController *vc = [[MyOrder shared] paymentViewControllerForOrder:order forceLogin:true onCompletion:^{
        [self performSegueWithIdentifier:@"toFinalOfferVC" sender:self];
    }];
    [self.navigationController pushViewController:vc animated:YES];

}

- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
