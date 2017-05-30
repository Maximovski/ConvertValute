//
//  DoneProtocol.h
//  ValuteConverter
//
//  Created by Вячеслав Максимовский on 25.05.17.
//  Copyright © 2017 Вячеслав Максимовский. All rights reserved.
//

#import <Foundation/Foundation.h>
@class textFieldDelegate;


@protocol DoneProtocol <NSObject>

- (void) onClickDone;
- (void)textField:(UITextField *)textField willStartEditingByDelegate:(textFieldDelegate *)delegate;
 @end
