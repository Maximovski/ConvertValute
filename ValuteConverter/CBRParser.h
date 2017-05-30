//
//  CBRParser.h
//  ValuteConverter
//
//  Created by Вячеслав Максимовский on 30.05.17.
//  Copyright © 2017 Вячеслав Максимовский. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString *const kCBRURL = @"http://cbr.ru/scripts/XML_daily.asp";

@interface CBRParser : NSObject <NSXMLParserDelegate>



@property (strong, nonatomic, readonly) NSXMLParser *parser;

- (NSDictionary *) parse;

@end
