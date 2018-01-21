#import <Foundation/Foundation.h>

@interface wizard : NSObject
@property (nonatomic) int hp;
@property (nonatomic) double mana;
@property (nonatomic) NSString *name;
@property (nonatomic) NSArray *spells;
- (instancetype)initName:(NSString*)name mana:(double)mana spells:(NSArray*)spells;
@end

@implementation wizard

- (instancetype)initName:(NSString*)name mana:(double)mana spells:(NSArray*)spells {
    self = [super init];
    if (self) {
        self.hp = 100;
        self.name = name;
        self.mana = mana;
        self.spells = spells;
    }
    return self;
}

- (NSString*)description {
    return [NSString stringWithFormat:@"%@ %d %.1f", self.name, self.hp, self.mana];
}

@end
