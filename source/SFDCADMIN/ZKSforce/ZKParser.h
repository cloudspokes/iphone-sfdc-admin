// Copyright (c) 2008-2010 Simon Fell
//
// Permission is hereby granted, free of charge, to any person obtaining a 
// copy of this software and associated documentation files (the "Software"), 
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense, 
// and/or sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included 
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
// THE SOFTWARE.
//

#include <libxml/parser.h>


@interface ZKElement : NSObject <NSCopying> {
	xmlDocPtr	doc;
	xmlNodePtr	node;
	ZKElement	*parent;
}
- (NSString *)name;
- (NSString *)namespace;
- (NSString *)stringValue;
- (ZKElement *)childElement:(NSString *)name;
- (ZKElement *)childElement:(NSString *)name ns:(NSString *)namespace;
- (NSArray *)childElements:(NSString *)name;
- (NSArray *)childElements:(NSString *)name ns:(NSString *)namespace;
- (NSArray *)childElements;
- (NSString *)attributeValue:(NSString *)name ns:(NSString *)namespace;
- (NSString *)attributeValue:(NSString *)name;

@end;

@interface ZKParser : NSObject {
}
+(ZKElement *)parseData:(NSData *)data;

@end
