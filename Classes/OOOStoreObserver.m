//
//  OOOStoreObserver.m
//  MonkeySwipe
//
//  Created by johan ten broeke on 3/26/10.
//  Copyright 2010 fullscreen. All rights reserved.
//

#import "OOOStoreObserver.h"

@implementation OOOStoreObserver

static OOOStoreObserver *_defaultStoreObserver = nil;

+ (OOOStoreObserver *)defaultStoreObserver
{
	if (!_defaultStoreObserver) {
		_defaultStoreObserver = [[self alloc] init];
	}
	return _defaultStoreObserver;
}

+(id)alloc
{
	NSAssert(_defaultStoreObserver == nil, @"Attempted to allocate a second instance of a OOOStoreObserver.");
	return [super alloc];
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
	for (SKPaymentTransaction *transaction in transactions)
	{
		switch (transaction.transactionState)
		{
			case SKPaymentTransactionStatePurchased:
				[self completeTransaction:transaction];
				break;
			case SKPaymentTransactionStateFailed:
				[self failedTransaction:transaction];
				break;
			case SKPaymentTransactionStateRestored:
				[self restoreTransaction:transaction];
			default:
				break;
		}
	}
}

- (void) failedTransaction: (SKPaymentTransaction *)transaction
{
	if (transaction.error.code != SKErrorPaymentCancelled)
	{
		// Optionally, display an error here.
	}
	
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"inAppPurchaseTransactionFailed" 
					   object:self
					   userInfo:nil]];
	
	[[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}


- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue{
    NSLog(@"paymentQueueRestoreCompletedTransactionsFinished %@",queue.transactions);
    NSLog(@"transactions count %i",[queue.transactions count]);
    if([queue.transactions count]==0){
        [[NSNotificationCenter defaultCenter] 
         postNotification:[NSNotification 
                           notificationWithName:@"inAppPurchaseTransactionFailed" 
                           object:self
                           userInfo:nil]];

        UIAlertView *noRestore = [[UIAlertView alloc] initWithTitle:@"Oops."
                                                            message:@"You haven't purchased the Golden Gun yet!"
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
        [noRestore show];
        [noRestore release];
    }
   
//    [[NSNotificationCenter defaultCenter] 
//	 postNotification:[NSNotification 
//					   notificationWithName:@"inAppPurchaseTransactionSuccess" 
//					   object:self
//					   userInfo:nil]];
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error{
    NSLog(@"restoring failed!%@", [error localizedDescription]);
    [[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"inAppPurchaseTransactionFailed" 
					   object:self
					   userInfo:nil]];
}

- (void) restoreTransaction: (SKPaymentTransaction *)transaction
{
	//If you want to save the transaction
	// [self recordTransaction: transaction];
	
	//Provide the new content
	// [self provideContent: transaction.originalTransaction.payment.productIdentifier];
	NSLog(@"transaction restore? %@",transaction);
	//Finish the transaction
    [[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"inAppPurchaseTransactionSuccess" 
					   object:self
					   userInfo:nil]];
	[[SKPaymentQueue defaultQueue] finishTransaction: transaction];
	
}



- (void) completeTransaction: (SKPaymentTransaction *)transaction
{
	//If you want to save the transaction
	// [self recordTransaction: transaction];
	
	//Provide the new content
	//[self provideContent: transaction.payment.productIdentifier];
	[[NSNotificationCenter defaultCenter] 
	 postNotification:[NSNotification 
					   notificationWithName:@"inAppPurchaseTransactionSuccess" 
					   object:self
					   userInfo:nil]];
	
	[[SKPaymentQueue defaultQueue] finishTransaction: transaction];
	
}

@end