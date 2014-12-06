model基类：

之前初始化model总要这么写：

@interface SPExangeModel : NSObject

/*!

 *  模型属性

 */

@property (nonatomic, copy) NSString * city;

@property (nonatomic, copy) NSString * content;

@property (nonatomic, copy) NSString * create_time;

@property (nonatomic, copy) NSString * credits;

@property (nonatomic, copy) NSString * eid;

@property (nonatomic, copy) NSString * exchange_time;

@property (nonatomic, copy) NSString * exchanged;

@property (nonatomic, copy) NSString * _id;

@property (nonatomic, copy) NSString * image;

@property (nonatomic, copy) NSString * key;

@property (nonatomic, copy) NSString * num;

@property (nonatomic, copy) NSString * status;

@property (nonatomic, copy) NSString * surplus;

@property (nonatomic, copy) NSString * tag;

@property (nonatomic, copy) NSString * title;

/*!

 *  使用字典初始化

 *

 *  @param dictionary

 *

 *  @return id

 */

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end

@implementation SPExangeModel

- (id)initWithDictionary:(NSDictionary *)dictionary

{

    self = [super init];

    if (self)

    {

        self.city      = SPFormatstring(dictionary[@"city"]);

        self.content   = SPFormatstring(dictionary[@"content"]);

        self.create_time = dictionary[@"create_time"];

        self.credits   = SPFormatstring(dictionary[@"credits"]);

        self.eid       = SPFormatstring(dictionary[@"eid"]);

        self.exchange_time = dictionary[@"exchange_time"];


        self.exchanged = SPFormatstring(dictionary[@"exchanged"]);

        self._id       = SPFormatstring(dictionary[@"id"]);

        self.image     = dictionary[@"image"];

        self.key       = dictionary[@"key"];

        self.num       = dictionary[@"num"];

        self.status    = SPFormatstring(dictionary[@"status"]);

        self.surplus   = SPFormatstring(dictionary[@"surplus"]);

        self.tag       = SPFormatstring(dictionary[@"tag"]);

        self.title     = dictionary[@"title"];

    }

    return self;

}



@end



当然model少了无所谓，model多了自然会很影响开发效率，自己也觉得别扭，现在只要继承一下这个baseModel，其它的方式不变!



                                  best_Cook





