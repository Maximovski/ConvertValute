//
//  pickerTextFieldDelegate.m
//  ValuteConverter
//
//  Created by Вячеслав Максимовский on 25.05.17.
//  Copyright © 2017 Вячеслав Максимовский. All rights reserved.
//

#import "pickerTextFieldDelegate.h"

@implementation pickerTextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    
    pickerView.dataSource = self.delegate;
    pickerView.delegate = self.delegate;
    
    
    textField.inputView = pickerView;
    
    return [super textFieldShouldBeginEditing:textField];
}
@end
