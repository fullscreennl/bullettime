//
//  OOOStoreView.m
//  oneonone
//
//  Created by johan ten broeke on 3/26/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOStoreView.h"
#import "OOOStoreObserver.h"
#import <UIKit/UIKit.h>
#import "OOOReachability.h"

@implementation OOOStoreView

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		isTrusted = NO;
		[self requestProductData];
	}
	return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
	[alertView setDelegate:nil];
	if (isTrusted) {
		[[NSNotificationCenter defaultCenter] 
		 postNotification:[NSNotification 
						   notificationWithName:@"inAppPurchaseTransactionSuccess" 
						   object:self
						   userInfo:nil]];
		return;
	}
	
	NSLog(@"alertview cancelled !");
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"inAppPurchaseTransactionFailed" 
					   object:self
					   userInfo:nil]];
		
}

- (void)dealloc {
	//[observer release];
    [warnDisabledAlert setDelegate:nil];
	[warnDisabledAlert release];
	[reachability_obj release];
    [mode release];
    NSLog(@"storeview dealloced!!");
	[super dealloc];
}

- (void) requestProductData
{
	isTrusted = NO;
	[reachability_obj release];
	reachability_obj = [[OOOReachability alloc] init];
	if([reachability_obj isOnline] == 0){
		warnDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Oops."
													   message:@"No internet connection."
													  delegate:self
											 cancelButtonTitle:@"OK"
											 otherButtonTitles:nil];
		[warnDisabledAlert show];
        [warnDisabledAlert release];
      
		return;
	}
	
	if([reachability_obj isOnline] == 2){
		warnDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Yeah."
													   message:@"Your device is trusted by Appjuice go on and upgrade for free!"
													  delegate:self
											 cancelButtonTitle:@"OK"
											 otherButtonTitles:nil];
		isTrusted = YES;
		[warnDisabledAlert show];
        [warnDisabledAlert release];
        
		return;
	}
	
	if([reachability_obj isOnline] == 4){
		warnDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Yeah."
													   message:@"BulletTime is FREE for a limited time only, go on and upgrade for free!"
													  delegate:self
											 cancelButtonTitle:@"OK"
											 otherButtonTitles:nil];
		isTrusted = YES;
		[warnDisabledAlert show];
        [warnDisabledAlert release];
        
		return;
	}
	
	
      // product_request = [[SKProductsRequest alloc] initWithProductIdentifiers: [NSSet setWithObject: @"GoldenGun"]];//
		product_request = [[SKProductsRequest alloc] initWithProductIdentifiers: [NSSet setWithObject: @"com.appjuice.BulletTime.GoldenGun"]];//
		product_request.delegate = self;
		[product_request start];
	
}

//***************************************
// PRAGMA_MARK: Delegate Methods
//***************************************
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
   // NSLog(@"app store response enveloe:%@",response.products);
	NSArray *myProduct = response.products;
	for(int i=0;i<[myProduct count];i++)
	{
		SKProduct *product = [myProduct objectAtIndex:i];
		NSLog(@"Name: %@ - Price: %f",[product localizedTitle],[[product price] doubleValue]);
		NSLog(@"Product identifier: %@", [product productIdentifier]);
		SKPayment *payment = [SKPayment paymentWithProductIdentifier:[product productIdentifier]];
		if (observer == nil){ 
			observer = [OOOStoreObserver defaultStoreObserver];
			[[SKPaymentQueue defaultQueue] addTransactionObserver:observer];
		}
        if([mode isEqualToString:@"restore"]){
            NSLog(@"trying to retore!!!");
            [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
        }else{
            if ([SKPaymentQueue canMakePayments]){
                 NSLog(@"can make payments!!!");
                [[SKPaymentQueue defaultQueue] addPayment:payment];
            }else{
                NSLog(@"In app purchases are disabled.!!");
                warnDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Oops,in App purchases are disabled."
                                                               message:@"Please go to restrictions in your settings panel to enable in app purchases."
                                                              delegate:self
                                                     cancelButtonTitle:@"OK"
                                                     otherButtonTitles:nil];
                [warnDisabledAlert show];
                [warnDisabledAlert release];
                [warnDisabledAlert setDelegate:nil];
                warnDisabledAlert = nil;
            }
            NSLog(@"current transactions : %@",[[SKPaymentQueue defaultQueue] transactions]);
        }
		
	}
	[product_request release];
    product_request = nil;
    NSArray *invalidProducts = response.invalidProductIdentifiers;
    if([invalidProducts count]>0){
        NSLog(@"invalid product response!!! %@",response.invalidProductIdentifiers);
        warnDisabledAlert = [[UIAlertView alloc] initWithTitle:@"Oops, the product is invalid"
                                                       message:@"It appears this in app purchase is no longer available"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [warnDisabledAlert show];
        [warnDisabledAlert release];
        warnDisabledAlert = nil;
        NSLog(@"throw something went wrong in the kitchen alert!!!");
    }
}

-(void) setMode:(NSString*)_mode{
    [_mode retain];
    [mode release];
    mode = _mode;
}

@end

