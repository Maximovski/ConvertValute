//
//  textFieldDelegate.h
//  ValuteConverter
//
//  Created by Вячеслав Максимовский on 25.05.17.
//  Copyright © 2017 Вячеслав Максимовский. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DoneProtocol.h"


@interface textFieldDelegate : NSObject <UITextFieldDelegate>

@property (weak, nonatomic) id <DoneProtocol, UIPickerViewDelegate, UIPickerViewDataSource> delegate;

- (instancetype)initWithDelegate:(id <DoneProtocol, UIPickerViewDelegate, UIPickerViewDataSource>)delegate;

@end
