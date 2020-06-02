根据约束力强弱，规约依次分为强制、推荐、参考三大类:

【强制】必须遵守。是不得不遵守的约定，违反本约定或将会引起严重的后果。

【推荐】尽量遵守。长期遵守这样的规定，有助于系统稳定性和合作效率的提升。

【参考】充分理解。技术意识的引导，是个人学习、团队沟通、项目合作的方向。

# 一、语言规约
### 命名规约
0. 【强制】命名约定通用准则：清晰、一致性、不能自我指涉  

  **清晰**：命名应该既清晰又简短，但拒绝为了追求简短而丧失清晰性，拒绝为了简洁进行随意缩写。

  <span style="color:green">正例：</span>

  | 命名                    | 说明                        |
  | --------------------- | ------------------------- |
  | insertObject:atIndex: | 好的命名                      |
  | removeObjectAtIndex:  | 好的命名                      |
  | removeObject:         | 这样命名也不错，因为方法将移除通过参数引用的对象。 |
  | destinationSelection  | 好的命名                      |
  | setBackgroundColor:   | 好的命名                      |

  <span style="color:red">反例：</span>

  | 命名            | 说明                 |
  | ------------- | ------------------ |
  | insert:at:    | 不清晰;插入什么?“at”表示什么? |
  | remove:       | 不清晰:要移除什么?         |
  | destSel       | 不清晰，缩写含义不清         |
  | setBkgdColor: | 缩写含义不清             |

  **一致性**：命名含义应该具有前后，全局的一致性，同个功能也应该使用同个名称。

  | 命名               | 说明                                       |
  | ---------------- | ---------------------------------------- |
  | - (NSInteger)tag | 该方法同时定义在 NSView、 NSCell、 NSControl 这三个类里面。 |

  **不能自我指涉**：除掩码常量、通知外，名称不应该自我指涉(self-reference)。
  
  <span style="color:green">正例：</span>

  | 命名                                   | 说明                |
  | ------------------------------------ | ----------------- |
  | NSString                             | 可以使用              |
  | NSUnderlineByWordMask                | 掩码常量，可以使用Mask自我指涉 |
  | NSTableViewColumnDidMoveNotification | 通知常量，可以使用Mask自我指涉 |
  
  
  <span style="color:red">反例：</span>
  
  | 命名                                   | 说明                |
  | ------------------------------------ | ----------------- |
  | NSStringObject                       | NSString本身已经是Object了，不需要再在名字里显示指出           |

0. 【强制】杜绝一切缩写，除以下已经长期使用形成共识的内容可以使用缩写。

  | 命名      | 说明                        |
  | ------- | ------------------------- |
  | alloc   | Allocate                  |
  | alt     | Alternate                 |
  | app     | Application.              |
  | calc    | Calculate                 |
  | dealloc | Deallocate                |
  | func    | Function                  |
  | horiz   | Horizontal                |
  | info    | Information               |
  | init    | InitiJYze                |
  | int     | Integer                   |
  | max     | Maximum                   |
  | min     | Minimum                   |
  | msg     | Message                   |
  | nib     | Interface Builder archive |
  | pboard  | Pasteboard                |
  | rect    | Rectangle                 |
  | Rep     | Representation            |
  | temp    | Temporary                 |
  | vert    | Vertical                  |

0. 【强制】文件名、自定义类、Protocol禁止以以下系统前缀开头。
	【AC,AB,AS,AL,AU,AV,CX,CF,CK,CN,CA,CB,NS,CF,CG,CI,CL,CM,MIDI,CM,CS,CT,CV,EK,EA,GC,GK,GLK,GSS,HK,HM,AD,CG,IN,GS,LA,MK,MA,MP,MT,MS,MF,MTL,MTK,MDL,MC,NE,NK,NC,AL,EAGL,PK,PH,CA,QL,RP,SF,SCN,SL,SF,SK,SC,TW,UI,UN,VS,VT,WC,WK】

0. 【参考】文件名、类、Protocol、常量、枚举等全局可见内容需要添加三个大写字符作为前缀，双字母前缀为 Apple 的类预留。尽管这个规范看起来有些古怪，但是这样做可以减少 Objective-C 没有命名空间所带来的问题。

0. 【强制】方法名、参数名、成员变量、局部变量都采用小写字符开头，名称中的单词首字符要大写的小驼峰形式。另外，请不要在方法名称中使用前缀（category方法除外）。 

   <span style="color:green">正例：</span>

    	fileExistsAtPath:isDirectory:

0. 【强制】如果方法代表一个对象执行的动作，则其名称应该以一个动词开头:  
   <span style="color:green">正例：</span>
	
		- (void)invokeWithTarget:(id)target; 
		- (void)selectTabViewItem:(NSTabViewItem *)tabViewItem;

0. 【强制】请不要使用 “do”或者 “does”作为名称的一部分，因为这些辅助性的动词不能为名称增加更多的含义。同时，请不要在动词之前使用副词或者形容词。   

0. 【强制】如果方法返回接收者的某个属性，则以属性名称作为方法名。如果方法没有间接地返回 一个或多个值，您也无须使用”get“这样的单词。
   
   <span style="color:green">正例：</span>
	
		- (NSSize)cellSize;

   <span style="color:red">反例：</span>

		 - (NSSize)calcCellSize;
		 - (NSSize)getCellSize;

0. 【强制】所有参数前面都应使用关键字。   
   <span style="color:green">正例：</span>

		- (void)sendAction:(SEL)aSelector to:(id)anObject forAllCells:(BOOL)flag;

   <span style="color:red">反例：</span>
	
		- (void)sendAction:(SEL)aSelector :(id)anObject :(BOOL)flag;

0. 【强制】如果您当前创建的方法比起它所继承的方法更有针对性，则您应该在已有的方法名称后 面添加关键字，并将其作为新方法的名称。

   | 命名                                       | 说明                      |
   | ---------------------------------------- | ----------------------- |
   | - (instancetype)initWithFrame:(NSRect)frameRect; | NSView                  |
   | - (instancetype)initWithFrame:(NSRect)frameRect mode:(int)aMode cellClass:(Class)factoryId numberOfRows:(int)rowsHigh numberOfColumns:(int)colsWide; | NSMatrix 是 NSView 的子 类。 |

0. 【推荐】请不要使用”and“来连接两个表示接受者属性的关键字。
         虽然下面的例子使用”and“这个词感觉还不错，但是随着创建的方法所带有的关键字越来 越多，这种方式会引起问题

   <span style="color:green">正例：</span>
    
    ```
    - (int)runModalForDirectory:(NSString *)path file:(NSString *) name types:(NSArray *)fileTypes;
    ```
	<span style="color:red">反例：</span>

    ```
    - (int)runModalForDirectory:(NSString *)path andFile:(NSString *)name andTypes:(NSArray *)fileTypes;
    ```

0. 【推荐】如果方法描述了两个独立的动作，请使用”and“把它们连接起来。

   <span style="color:green">正例：</span>
```
   - (BOOL)openFile:(NSString *)fullPath withApplication:(NSString *)appName andDeactivate:(BOOL)flag;
```
  	
0. 【强制】您可以使用情态动词(在动词前冠以“can”,"should","will"等)，使得方法的名称更加明 确，但是请不要使用“do”或“does”这样的情态动词。

   <span style="color:green">正例：</span>

	```
	- (void)setCanHide:(BOOL)flag;		
	- (BOOL)canHide;
	- (void)setShouldCloseDocument:(BOOL)flag;
	- (BOOL)shouldCloseDocument; 
	```

   <span style="color:red">反例：</span>

	```
	- (void)setDoesAcceptGlyphInfo:(BOOL)flag; 
	- (BOOL)doesAcceptGlyphInfo;
	```
0. 【强制】只有当方法间接地返回对象或者数值，您才需要在方法名称中使用 get"。这种格式只适 用于需要返回多个数据项的方法。

   <span style="color:green">正例：</span>

	```
	- (void)getLineDash:(float *)pattern count:(int*)count phase:(float *)phase;
	```

0. 【强制】下面是数条和方法参数命名相关的通用规则:
  * 和方法名称一样， 参数的名称也是以小写的字符开头，并且后续单词的首字符要大写。 例如:removeObject:(id)anObject。
  * 请不要在参数名称中使用"pointer"或者"ptr"。您应该使用参数的类型来声明参数是否是 一个指针。
  * 请不要使用一到两个字符的名称作为参数名。
  * 请不要使用只剩几个字符的缩写。

0. 【强制】方法名称的开头应标识出发送消息的对象所属的类:

  <span style="color:green">正例：</span>

  ```
  - (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(int)row;
  - (BOOL)application:(NSApplication *)sender openFile:(NSString
    *)filename;
  ```

0. 【强制】如果调用某个方法是为了通知委托某个事件已经发生或者即将发生， 则请在方法名称 中使用“did”或者“will”这样的助动词。

  <span style="color:green">正例：</span>

  ```
  - (void)browserDidScroll:(NSBrowser *)sender;
  - (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)window;
  ```

0. 【强制】如果调用某个方法是为了要求委托代表其他对象执行某件事，当然，您也可以在方法名 称中使用“did”或者“will”，但我们倾向于使用“should”。

  <span style="color:green">正例：</span>

  ```
  - (BOOL)windowShouldClose:(id)sender;
  ```

### 常量定义

0. 【强制】请使用NS_ENUM枚举类型来表示一群相互关联的整数值常量。枚举项以枚举类型为前缀。

	示例：
	
    ```
    typedef NS_ENUM(NSInteger,NSMatrixMode) {
    NSMatrixModeRadio = 0,
    NSMatrixModeHighlight = 1,
    NSMatrixModeList = 2,
    NSMatrixModeTrack = 3
    } ;
    ```
0. 【强制】请使用NS_OPTIONS定义一组相互关联的位移枚举常量。位移枚举常量是可以组合使用的。枚举项以枚举类型为前缀。

 	示例: 

    ```
    typedef NS_OPTIONS(NSUInteger,NSMatrixModeMask) {
    NSMatrixModeMaskBorderless     = 0,
    NSMatrixModeMaskTitled = 1 << 0,
    NSMatrixModeMaskClosable = 1 << 1,
    NSMatrixModeMaskMiniaturizable = 1 << 2,
    NSMatrixModeMaskResizable = 1 << 3
    };
    ```

0. 【强制】请使用 const 来创建浮点值常量。如果某个整数值常量和其他的常量不相关，您也可以使用 const 来创建，否则，则应使用枚举类型。下面的声明展示了 const 常量的格式:

    ```
    const float NSLightGray;
    ```

0. 【强制】通常情况下，请不要使用#define 预处器理命令创建常量。对于整数值常量，请使用枚举类型创建，而对于浮点值常量，请使用const 修饰符创建。

0. 【强制】有些符号，预处理器需要对其进行计算，以便决定是否要对某一代码块进行处理，则它 们应该使用大写字符表示。例如:

  ```
  #ifdef DEBUG
  ```

0. 【强制】推荐使用常量来代替字符串字面值和数字。常量应该用 static 声明为静态常量，而不要用 #define，除非它明确的作为一个宏来使用。
	
	这样能够方便复用，而且可以快速修改而不需要查找和替换
	
  <span style="color:green">正例：</span>
  ```
  static NSString * const ZOCCacheControllerDidClearCacheNotification = @"ZOCCacheControllerDidClearCacheNotification";
  static const CGFloat ZOCImageThumbnailHeight = 50.0f;
  ```

  <span style="color:red">反例：</span>

  ```
  #define CompanyName @"Apple Inc."
  #define magicNumber 42
  ```
  常量应该在头文件中以这样的形式暴露给外部：

  `extern NSString *const ZOCCacheControllerDidClearCacheNotification;`

  并在实现文件中为它赋值。

0. 【强制】异常使用全局的 NSString 对象来标识，其名称按如下的方式进行组合:异常名称中的具有唯一性的那部分，其组成词应该拼写在一起， 并且每个单词的首字符要大写。  
     **[Prefix] + [UniquePartOfName] + Exception**

	<span style="color:green">正例：</span>
  
   ```
	NSColorListIOException
	NSColorListNotEditableException 
	NSDraggingException
	NSFontUnavailableException
	NSIllegalSelectorException
	```
0. 【强制】Notification消息使用全局的 NSString 对象进行标识，其名称按如下的方式组合:

    **[Name of associated class] + [Did | Will] + [UniquePartOfName] + Notification**  

	<span style="color:green">正例：</span>
	
	```
    NSApplicationDidBecomeActiveNotification  
    NSWindowDidMiniaturizeNotification
    NSTextViewDidChangeSelectionNotification
    NSColorPanelColorDidChangeNotification
	```

### 类定义规约	
0. 【推荐】要尽可能地使用属性定义代替无修饰的实例变量。 
	
	 <span style="color:green">正例：</span>
	
	```
	@interface Item : NSObject
	@property(nonatomic, copy) NSString* name;
	@end

	```
	 <span style="color:red">反例：</span>

	```	
	@interface Item : NSObject {
	    NSString* _name
	}
	@end
	```
0. 【推荐】如果需要自定义property的getter或setter方法时，请在声明property时一起声明掉。
	
 	`@property(getter=my_XXX ,setter=my_setXXX) id xxx;`

0. 【推荐】对外暴露的属性，尽量定义为readonly。

0. 【推荐】不建议使用`@dynamic`修饰属性，除非你真的知道自己在干什么。

0. 【强制】在为某个类添加实例变量时，请记住下面几个因素:
	- 只暴露必须的对外接口或属性在.h中，其它private保留在.m里。
  - 请确保实例变量的名称能够扼要地描述它所保存的属性。 
0. 【强制】不复写任何 ``+ (void) load ``方法。所有的load方法的执行在Class的装载阶段，会延长App的启动时间.且如果存在稳定性问题，也没有可以修复的时机。
0. 【强制】``+（void）initiJYze``必须判断``class``类型或使用``dispatch_once``防止执行多次.
  	由于任何继承类也会执行父类的``initilize``，所以这里一定要做类型判断，或使用``dispatch_once``来保障不会执行多次

    ``` 
    if (self == [NSFoo class]) {
    	// the initiJYzing code
      }
    ```

0. 【强制】不应该显式地调用 `initiJYze` 方法。如果需要触发初始化行为，则请调用一些无害的方法。
	
	<span style="color:green">正例：</span>
	
	`[NSImage self];`
	
	<span style="color:red">反例：</span>
	
	`[NSImage initiJYze];`
0. 【强制】在property的getter方法里不能再显式或者隐式的调用同一个property的getter方法，会导致死循环。

	<span style="color:red">反例：</span>

	```
	@interface ALPerson : NSObject
	@property (nonatomic, copy) NSString *name;
	@end
	
	@implementation ALPerson
	- (void)setName:(NSString *)name {
	    self.name = name;//死循环！
	}
	@end
	```	

0. 【推荐】方法调用，方法调用应尽量保持与方法声明的格式一致。当格式的风格有多种选择时，新的代码要与已有代码保持一致。

   调用时所有参数应该在同一行：
	
	```
	[myObject doSomethingWith:arg1 name:arg2 error:arg3];
	```
	
	或者每行一个参数，以冒号对齐：
	
	```
	[myObject doSomethingWith:arg1
	               name:arg2
	              error:arg3];
	```
	
	方法定义与方法声明一样，当关键字的长度不足以以冒号对齐时，下一行都要以四个空格进行缩进。
	
	```
	[myObj short:arg1
	    longKeyword:arg2
	    evenLongerKeyword:arg3];
	```
0. 【推荐】使用`nonnull`、`nullable`,`__kindof`来修饰方入参数、返回值、属性

	```
	@property (nonatomic, strong, nonnull) Sark *sark;
	@property (nonatomic, copy, readonly, nullable) NSArray *friends;
	+ (nullable NSString *)friendWithName:(nonnull NSString *)name;

	```	
0. 【强制】禁止从 designated initiJYzer 里面调用一个 secondary initiJYzer。如果这样，调用很可能会调用一个子类重写的 init 方法并且陷入无限递归之中。
	- Objective-C 有指定初始化方法(designated initiJYzer)和间接(secondary initiJYzer)初始化方法的观念。 designated 初始化方法是提供所有的参数，secondary 初始化方法是一个或多个，并且提供一个或者更多的默认参数来调用 designated 初始化的初始化方法。
	- 一个类应该有且只有一个 designated 初始化方法，其他的初始化方法应该调用这个 designated 的初始化方法
	- 在希望提供你自己的初始化函数的时候，应该遵守这三个步骤来保证获得正确的行为：
		- 定义你的 designated initiJYzer，确保调用了直接超类的 designated initiJYzer。
		- 重载直接超类的 designated initiJYzer。调用你的新的 designated initiJYzer。
		- 为新的 designated initiJYzer 写文档。可以用编译器的指令 `__attribute__((objc_designated_initiJYzer))` 来标记。用编译器指令`__attribute__((unavailable(Invoke the new designated initiJYzer))`让父类的 designated initiJYzer 失效.

	正例
	
	```
	@interface ZOCNewsViewController : UIViewController
	
	- (instancetype)initWithNews:(ZOCNews *)news __attribute__((objc_designated_initiJYzer));
	- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil __attribute__((unavailable("Invoke the designated initiJYzer,call initWithNews:")));
	- (instancetype)init __attribute__((unavailable("Invoke the designated initiJYzer,call initWithNews:"));
	
	@end

	@implementation ZOCNewsViewController
	
	- (id)initWithNews:(ZOCNews *)news
	{
	    //调用直接父类的 designated initiJYzer
	    self = [super initWithNibName:nil bundle:nil];
	    if (self) {
	        _news = news;
	    }
	    return self;
	}
	
	// 重载直接父类的  designated initiJYzer
	// 如果你没重载 initWithNibName:bundle: ，而且调用者决定用这个方法初始化你的类(这是完全合法的)。 initWithNews: 永远不会被调用，所以导致了不正确的初始化流程，你的类的特定初始化逻辑没有被执行。
	- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
	{
	    // call the new designated initiJYzer
	    return [self initWithNews:nil];
	}
	
	@end
	```
	
	
	
	反例
	
	```
	@implementation ParentObject
		
	//designated initiJYzer	
	- (instancetype)initWithURL:(NSString*)url title:(NSString*)title {
	    if (self = [super init]) {
	        _url = [url copy];
	        _title = [title copy];
	    }
	    return self;
	}
	//secondary initiJYzer
	- (instancetype)initWithURL:(NSString*)url {
	    return [self initWithURL:url title:nil];
	}
	
	@end
	
	
	@interface ChildObject : ParentObject
	
	@end
	
	@implementation ChildObject
	//designated initiJYzer
	- (instancetype)initWithURL:(NSString*)url title:(NSString*)title {
		//在designated intiJYzer中调用 secondary initiJYzer，错误的
	    if (self = [super initWithURL:url]) {
	        
	    }
	    return self;
	}
	
	@end
	
	@implementation ViewController
	
	- (void)viewDidLoad {
	    [super viewDidLoad];
	    // 这里会死循环
	    ChildObject* child = [[ChildObject alloc] initWithURL:@"url" title:@"title"];
	}
	@end
	```
	
### 注释规约

0. 【强制】头文件中的暴露的方法或者属性都必须添加注释
0. 【推荐】注释建议使用Xcode自带工具插入默认格式。`option+command+/`即可自动插入。
0. 【强制】自动生成的代码注释中的placeholder要替换掉
0. 【推荐】建议对于复杂难懂逻辑添加注释

### 代码组织规约
0. 【推荐】当一个类功能很多时，建议使用Category的方式进行功能划分,这些Category可以放在同一个文件中。
	
	示例：
	
	```
	@interface UIViewController (UIViewControllerRotation)
	
	+ (void)attemptRotationToDeviceOrientation NS_AVAILABLE_IOS(5_0) __TVOS_PROHIBITED;
	- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation NS_DEPRECATED_IOS(2_0, 6_0) __TVOS_PROHIBITED;
	@end
	
	@interface UIViewController (UILayoutSupport)
	@property(nonatomic,readonly,strong) id<UILayoutSupport> topLayoutGuide NS_AVAILABLE_IOS(7_0);
	@property(nonatomic,readonly,strong) id<UILayoutSupport> bottomLayoutGuide NS_AVAILABLE_IOS(7_0);
	@end
	
	@interface UIViewController (UIKeyCommand)
	- (void)addKeyCommand:(UIKeyCommand *)keyCommand NS_AVAILABLE_IOS(9_0);
	- (void)removeKeyCommand:(UIKeyCommand *)keyCommand NS_AVAILABLE_IOS(9_0);
	
	@end

	```
0. 【推荐】建议使用`#pragma marks -` 来进行方法分组，提高可读性，具体样例如下，建议把生命周期，事件，`property`方法以及`protocol`方法进行区分。

  示例：

  ``` 
  #pragma mark - Lifecycle

  - (instancetype)init {}
  - (void)dealloc {}
  - (void)viewDidLoad {}
  - (void)viewWillAppear:(BOOL)animated {}
  - (void)didReceiveMemoryWarning {}

  #pragma mark - Custom Accessors

  - (void)setCustomProperty:(id)value {}
  - (id)customProperty {}

  #pragma mark - IBActions

  - (IBAction)submitData:(id)sender {}

  #pragma mark - Public

  - (void)publicMethod {}

  #pragma mark - Private

  - (void)privateMethod {}

  #pragma mark - Protocol conformance
  #pragma mark - UITextFieldDelegate
  #pragma mark - UITableViewDataSource
  #pragma mark - UITableViewDelegate

  #pragma mark - NSCopying

  - (id)copyWithZone:(NSZone *)zone {}

  #pragma mark - NSObject

  - (NSString *)description {}
  ```

0. 【推荐】建议合理使用group或folder来组织工程结构，而不是全部放在source里，物理group与工程中group要对应

0. 【推荐】过期方法，不要直接删除，先标记为`depcrated`。

0. 【推荐】建议类继承关系不要超过2层，并且抽取公共逻辑到父类，尽量避免父类，子类方法调用跳跃

0. 【参考】尽量减少继承，可以考虑组合，`category`，`protocol`等方式

0. 【推荐】每个文件.m的方法数目不应该超过20个，每个方法的行数不应该超过200行。
	- 每个方法应该只做一件事情。当函数过长时，它做的事情通常会不明确，后续会很难理解与维护。
0. 【强制】函数内嵌套不能太深,一个函数内大括号里嵌套大括号不能超过三层。
	- 超过三层已经很难理解一个函数的作用，可以将其中的一些逻辑抽离成一个单独的函数
0. 【推荐】建议业务bundle使用统一的前缀来标识

0. 【推荐】头文件中只暴露出需要给他人调用的类、方法及属性，私有类、方法、变量放在.m中

0. 【强制】Release包必须关闭Log

0. 【强制】必须清理工程中的所有warning
0. 【推荐】长条件判断建议使用bool变量来代替
	- 太长不容易调试，且不直观。
	
   <span style="color:green">正例：</span>
	
	```
	BOOL isConditionSatisfied = (1 == a.x &&  3==b.y && 2 == c.x);
	if (isConditionSatisfied){
	 doSomething()
	}
	```
   <span style="color:red">反例：</span>

	```
	if (a.x = 1 && b.y =3 && c.x = 2){
	 doSomething()
	}
	```

0. 【推荐】条件判断,推荐加大括号，即使一行，容易导致的错误为，当 if 语句里面的一行被注释掉，下一行就会在不经意间成为了这个 if 语句的一部分。[参考](http://softwareengineering.stackexchange.com/questions/16528/single-statement-if-block-braces-or-no/16530#16530)

	```
	if (!error) {
	    return success;
	}
	```
	反对：
	
	```
	if (!error)
	    return success;
	```
	
	或
	
	```
	if (!error) return success;
	```
0. 【推荐】对三目运算使用时，要注意简化，x=a?a:b 只要写成x=a?:b 即可；
0. 【推荐】编写switch语句的时候, 一定要实现default:，防止外部异常调用，内部没有处理的情况,每个
0. 【强制】switch里每个case里需要强制有break;
0. 【强制】switch里每个case里都要使用{}所有代码括起来,就算只有一行;

# 二、最佳实践

### 多线程
0. 【强制】自建线程必须命名。
0. 【强制】多线程访问同一个对象时，必须注意临界区的保护
0. 【强制】单例创建要使用线程安全模式，并且禁止在单例的init方法中使用dispatch_sync来阻塞线程，极易出现死锁

   <span style="color:green">正例：</span>

   ```objective-c
   + (instancetype)sharedInstance {
           static id sharedInstance = nil;
           static dispatch_once_t onceToken;
           dispatch_once(&onceToken, ^{	
              sharedInstance = [[self alloc] init];
           });
           return sharedInstance;
        }
   ```
0. 【强制】在多线程环境下使用懒加载方式加载变量，会有crash风险，必须加锁*保护*

   <span style="color:green">正例：</span>

   ```objective-c
	//多线程环境下调用
	- (NSCache *)contactCache
    {
   		if (!_contactCache) {
      		@synchronized(self) { 
      			if (!_contactCache) {
         			_contactCache = [[NSCache alloc] init];
         			_contactCache.name = @"contactCache";
         		}
        	}
    	}
     	return _contactCache;
    }
   ```

0. 【强制】`performSelector:withObject:afterDelay:`要在有Runloop的线程里调用，否则调用无法生效。
    
    说明：异步线程默认是没有runloop的，除非手动创建；而主线程是系统会自动创建Runloop的。所以在异步线程调用是请先确保该线程是有Runloop的。
0. 【强制】禁止随意创建长驻线程，除非是在整个app运行周期内都必须存在且有任务运行的。
0. 【推荐】NSNotificationCenter在iOS 8及更老系统上存在多线程bug，selector执行到一半时可能会因为self销毁而触发crash，解决方案是在selector里开始的地方引入下面的宏：

   ```objective-c
   - (void)onMultiThreadNotificationTrigged:(NSNotification *)notify
   {
       __weak typeof(self) weakSelf = self;
       __strong typeof(self) strongSelf = wself;
       if (! weakSelf) { 
       	return; 
       }

       [strongSelf doSomething];
   }
   ```

0. 【推荐】在多线程应用中，Notification在哪个线程中post，就在哪个线程中被转发，而不一定是在注册观察者的那个线程中。如果发送消息的不在主线程，而接受消息的回调里做了UI操作，需要让其在主线程执行。
   
0. 【推荐】仅当必须保证顺序执行时才使用`dispatch_sync`，否则容易出现死锁，应避免使用，可使用`dispatch_async`。

   <span style="color:red">反例：</span>

   ```objective-c
   // 禁止。出现死锁，报错:EXC_BAD_INSTRUCTION。原因:在主队列中同步的添加一个block到主队列中
	- (void)viewDidLoad {
      [super viewDidLoad];

      dispatch_queue_t mainQueue = dispatch_get_main_queue();
      dispatch_block_t block = ^() {
          NSLog(@"%@", [NSThread currentThread]);
      };
      dispatch_sync(mainQueue, block);
   }
   ```

   <span style="color:green">正例：</span>

   ```objective-c
     // 推荐
	- (void)viewDidLoad {
      [super viewDidLoad];

      dispatch_queue_t mainQueue = dispatch_get_main_queue();
      dispatch_block_t block = ^() {
          NSLog(@"%@", [NSThread currentThread]);
      };
      dispatch_async(mainQueue, block); //使用异步操作
   }
   ```

0. 【参考】使用 `performSelector:withObject:afterDelay:`和 `cancelPreviousPerformRequestsWithTarget` 组合的时候要小心
   * afterDelay会增加receiver的引用计数，cancel则会对应减一
   * 如果在receiver的引用计数只剩下1 （仅为delay）时，调用cancel之后会立即销毁receiver，后续再调用receiver的方法就会crash

    <span style="color:green">正例：</span>

   ```objective-c
    __weak typeof(self) weakSelf = self;
	[NSObject cancelPreviousPerformRequestsWithTarget:self];
	if (!weakSelf)
	{
   	//NSLog(@"self被销毁");
		return;
   	}

   	[self doOther];
   ```

0. 【强制】禁止在非主线程中进行UI元素的操作

0. 【强制】在主线程中禁止进行同步网络资源读取，使用NSURLSession进行异步获取

0. 【强制】如果需要进行大文件或者多文件的IO操作，禁止主线程使用，必须进行异步处理

0. 【强制】对剪贴板的读取必须要放在异步线程处理，最新Mac和iOS里的剪贴板共享功能会导致有可能需要读取大量的内容，导致读取线程被长时间阻塞

	<span style="color:green">正例：</span>

	```
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
	   UIPasteboard *pasteboard = [UIPasteboard generalPasteboard]; 
	   if (pasteboard.string.length > 0) {//这个方法会阻塞线程
	      NSString *text = [pasteboard.string copy];
	      [pasteboard setValue:@"" forPasteboardType:UIPasteboardNameGeneral];
	      if (text == nil || [text isEqualToString:@""]) {
	          return ;
	      }
	      dispatch_async(dispatch_get_main_queue(), ^{
	          [self processShareCode:text];
	      });
	   }
	});
	```


### 内存管理
0. 【推荐】请慎重使用单例，避免造成产生不必要的常驻内存。
0. 【推荐】单例初始化方法中尽量保证单一职责,尤其不要进行其他单例的调用。极端情况下，两个单例对象在各自的单例初始化方法中调用，会造成死锁。


0. 【强制】Delegate需要用weak进行引用。

0. 【强制】使用block时，需要在block访问外部weak修饰的self，内部在重新strong处理。避免RetainCycle。

0. 【推荐】strong引用 子实例，weak引用parent，基础类型使用assign，NSString，NSArray，block使用copy
	
	假如有一个NSMutableString,现在用他给一个retain修饰 NSString赋值,那么只是将NSString指向了NSMutableString所指向的位置,并对NSMUtbaleString计数器加一,此时,如果对NSMutableString进行修改,也会导致NSString的值修改,原则上这是不允许的.  如果是copy修饰的NSString对象,在用NSMutableString给他赋值时,会进行深拷贝,及把内容也给拷贝了一份,两者指向不同的位置,即使改变了NSMutableString的值,NSString的值也不会改变.所以用copy是为了安全,防止NSMutableString赋值给NSString时,前者修改引起后者值变化而用的.

0. 【强制】对类添加属性时使用 copy 方式还是使用 retain 方式规约：

 	- 对实现 NSCopying 协议的对象使用 copy 方式。通常情况下,诸如NSString、NSURL, block,NSArray 这样的对象应该能被copy;
 	- 像UIView的对象则应该可以被保持。strong引用 子实例，weak引用parent. 	
 	- 基础类型使用assign。

0. 【强制】在`dealloc`中要记得要`remove observer`， `callback=null`
0. 【强制】会循环使用的Timer(指定了`repeat`参数为`YES`)，必须要在合适的时机调用`invJYdate`方法，否则会出现内存泄漏，在使用类的析构函数中调用Timer的`invJYdate`方法为时已晚，因为timer会对其传递的目标object增加引用计数，若不调用`invJYdate`，使用类根本得不到析构。
对于指定了`repeat`参数为`NO`的`Timer`，则可以不调用`invJYdate`方法。

0. 【强制】在 `dealloc`中不允许使用`self`访问属性（父类属性除外），只允许通过"_变量名"直接访问。
	- 容易出现重复创建对象，甚至crash问题
	- 在`dealloc`阶段，`self`是一个不完整的对象。
<!--	- 由于accessor方法是可以被子类重写的，在调用父类init初始化的时候，使用self访问属性会调到子类重写的（如果有）getter或setter，这就出现了先于子类init访问其属性或调用子类方法的情况，如果子类getter或setter中有一些特殊的处理逻辑，在某些极端情况下就可能出现行为不一致的问题。
由于在init函数返回前，对象结构和结构是不稳定的，在init函数内对任何方法的调用（尤其是public方法）都应该慎之又慎。dealloc同理。
-->
0. 【推荐】在非`init`和`dealloc`方法中访问属性推荐通过getter方法获取，不推荐直接使用“_变量名”。
0. 【推荐】在`init`中不需要直接使用的`Property`,建议使用`lazyloading`的方法创建。
0. 【强制】在创建大量临时的 UIImage，或者 Model 之类的对象的时，用 `@autoreleasepool` 使 `autorelease` 对象在结束时间释放，缓解内存的压力。比如：

    <span style="color:green">正例：</span>

        NSMutableArray *datJYst = [NSMutableArray new];
        NSMutableArray *imageList = [NSMutableArray new];
        [datJYst enumerateObjectsUsingBlock:^(NSDictionary *dict, NSUInteger idx, BOOL *stop) {
            @autoreleasepool {
                NSData *data = datJYst[idx];
                UIImage *image = [[UIImage alloc] initWithData:data];
                //可能对 image 进行一些处理，裁剪之类的
                [imageList addObject:image];
            }
        }];

0. 【强制】在使用到 `UIScrollView，UITableView，UICollectionView` 的 `Class` 中，需要在 `dealloc` 方法里手动的把对应的 `delegate, dataSouce` 置为 `nil`
	- 防止在`scrollView`滑动时页面退出，`delegate`释放,出现crash问题
	- 苹果在iOS9上已经将以上类的`delegate`及`datasource`由`assign`改为了`weak`,如果只支持9.0以上，则不需要手动置`nil`

0. 【推荐】在`dealloc`中，避免将`self`作为参数传递。如果被`retain`住，到下个runloop周期再次释放，则会造成多次释放`crash`。 


    ```objective-c
    -(void)dealloc{
    	[self unsafeMethod:self]; 
    	//因为当前已经在self所指向对象的销毁阶段，如果在unsafeMethod:中将self放到了autorelease pool中，那么self会被retain住，计划下个runloop周期再进行销毁；但是dealloc运行结束后，self对象的内存空间就直接被回收了，self变成了野指针
        //当到了下个runloop周期，self指向的对象实际上已经被销毁，会因为非法访问造成crash问题
    }
    ```
0. 【推荐】除非是非法参数等提前判断提前return的可以写在最前面。其他的return建议有效返回值尽量只剩最后一个。提前return时，要注意是否有对象没有被释放(常见的有CF对象)，是否有锁没有释放等配对问题。

0. 【强制】禁止一次性申请超过10MB的内存。
	- 内存过高将会导致app被kill，并且没有crash堆栈。而申请大内存将会增加内存峰值，更容易出现内存过高而crash。
    ​

### 集合
包括，但不限于 ``NSMutableDictionay``,``NSMutableArray``,``NSMutableSet``

0. 【强制】插入对象需要做判空处理。
0. 【强制】注意线程安全问题，必要时加锁，保障线程安全
0. 【强制】先copy，再枚举操作，禁止对非临时变量的可变集合进行枚举操作，多线程情况下有可能因为可变集合在进行枚举时发生改变进而crash。

     <span style="color:green">正例：</span>
     
	```
	//正确的写法
	- (void)checkAllVJYdItems{
		[_arrayLock lock];
	    NSArray *array = [oldArray copy];
	    [_arrayLock unlock];
	    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
	        //do something using obj
	      
	    }];
	}
	```

     <span style="color:red">反例：</span>
     
	```objective-c
	//错误的写法
	-(void)checkAllVJYdItems{
		[self.allItems enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
	         //do something using obj
	         //如果在enumerate过程中其它线程对self.allItems进行了变更操作，这里就会引发crash
	     }];
	}
	```

0. 【推荐】大部分情况下都不使用可变集合作为成员变量，如果确实需要进行集合的增删改操作，使用临时可变集合变量处理，之后再进行赋值操作
0. 【强制】禁止返回mutable对象，禁止mutable对象作为入参传递。
0. 【推荐】如果使用NSMutableDictionary作为缓存，推荐使用NSCache代替
0. 【推荐】容器类使用泛型来指定对象的类型

	<span style="color:green">正例：</span>
	
	```
	@property (readonly) NSArray<NSURL *> *imageURLs;
	
	NSDictionary<NSString *, NSNumber *> *mapping = @{@"a": @1, @"b": @2};

	```
	
	<span style="color:red">反例：</span>


	```
	@property (readonly) NSArray *imageURLs;

	NSDictionary *mapping = @{@"a": @1, @"b": @2};

	```
	
	
### 字符串
0.  【推荐】当使用`keypaths:@"xx"`时候，尽量使用`NSStringFromSelector(@selector(xx))`方式，防止某个`key`被删除后没有编译感知
0.  【强制】取`substring`的时候要考虑`emoji`字符的问题，防止截到中间crash

	```
	- (NSString *)dt_substringToIndex:(NSUInteger)index
	 {
	 	//... 越界判断
	 	NSRange wRange = [self rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, index)];
	 	return [self substringWithRange:wRange];
	 }
	```

### 锁
0. 【推荐】专锁专用，一个lock对象只负责一个任务。这样可以在逻辑上进行区分，也可以避免潜在的死锁问题
0. 【推荐】不同锁的使用场景：
     - 性能最好的属 `pthread_mutex`、`dispatch_semaphore`，另外`dispatch_semaphore`在等待的时候会释放CPU资源，所以适合用在等待耗时较长的场景；
     - `@synchronized`是最简单易用的递归锁，不会有忘记`unlock`的情况，但性能也是最低的，适合用在对性能要求不高的场景;
     - 其他的还有`NSLock`，性能介于上面二者之间，也有对应的条件锁`NSConditionLock`和递归锁`NSRecursiveLock`，因为是`Objective-C`对象，适合用在偏`Objective-C`编程的场景，比如需要把锁存放在`NSDictionary`中的场景。
     - 关于不同锁的性能对比，可以参考下图.根据自己的需求选择适合的锁
    ![](lockCompare.png)
0. 【强制】在使用锁的过程中如果要`return`，切记要先进行`unlock`; 如果可能有`exceptio`n发生，那么需要在`@finally`中进行锁的释放

     <span style="color:green">正例：</span>

  ```
  - (void) exclusiveMethod1{
	  	[self.lock lock];
	  	
	  	if (condition == true){
	  		//这里要记得unlcok，否则下次在进入这个方法就会发生线程被死锁的问题
	  		[self.lock unlock];
	  		return;
	  	}
	  	
	  	[self.lock unlok];
  }

  - (void) exclusiveMethod2{
	  	[self.lock lock];
	  	
	  	@try{
	  		//异常发生
	  	}@catch(NSException* ex){
	  	}@finally{
	  		//此处需要进行锁的回收
	  		[self.lock unlok];
	  	}
  }
  ```

### IO
0. 【参考】尽量减少使用NSUserDefault.
0. 【推荐】```[[NSUserDefaults standardUserDefaults] synchronize]```会block当前线程直到所有UserDefault里的内容写回存储；如果内容过多，重复调用的话会严重影响性能。建议只有在合适的时候（比如退到后台）再进行持久化操作（此方法即将deprecated，可以不再调用）
0. 【推荐】一些经常被读取的本地文件建议做好内存缓存，减少IO开销
0. 【推荐】文件存储路径请遵循以下规则：

	1、Documents 目录：您应该将所有的应用程序数据文件写入到这个目录下。这个目录用于存储用户数据。该路径可通过配置实现iTunes共享文件。可被iTunes备份。
	
	2、AppName.app 目录：这是应用程序的程序包目录，包含应用程序的本身。由于应用程序必须经过签名，所以您在运行时不能对这个目录中的内容进行修改，否则可能会使应用程序无法启动。

	3、Library 目录：这个目录下有两个子目录：
Preferences 目录：包含应用程序的偏好设置文件。您不应该直接创建偏好设置文件，而是应该使用NSUserDefaults类来取得和设置应用程序的偏好.
Caches 目录：用于存放应用程序专用的支持文件，保存应用程序再次启动过程中需要的信息。
可创建子文件夹。可以用来放置您希望被备份但不希望被用户看到的数据。该路径下的文件夹，除Caches以外，都会被iTunes备份。

	4、tmp 目录：这个目录用于存放临时文件，保存应用程序再次启动过程中不需要的信息。该路径下的文件不会被iTunes备份。

### UI
0. 【推荐】不要在除了`viewDidLoad`方法之外调用`ViewController`的`self.view`来进行`view`操作，特别是在一些系统通知之类的回调中，有可能造成`self.view`创建出来之后没有被加入到当前层级，导致子`view`的诡异问题. 

  ```objective-c
  - (void)didReceiveMemoryWarning{
   		[super didReceiveMemoryWarning];
    	[self.view doSomething]; //如果当VC已经被创建，但是view还没有加入到view层级中时(比如Tabbar初始化之后的非选中VC)，此时接收到了内存警告，那么self.view会被直接创建，没有加入到层级，导致其子view可能处于异常的状态
  }
  ```
 ​

0. 【推荐】如果想要获取app的window,不要view.window来获取,可以使用[[UIApplication sharedApplication] keyWindow]来获取。
	
	说明：如果view不在展示时，获取window会是nil，而不是真正的app所在的window.
	
0. 【强制】UI对象只允许在主线程访问。（避免在异步线程里释放，这样可以避免在dealloc时访问view结构导致问题）

0. 【强制】禁止在ViewController的dealloc方法中访问self.view，会导致已经释放的view被再次重建，可能会造成各种不可预知的问题

0. 【强制】显示带``textfield``的``alert``之前，一定要确保键盘不在显示状态，否则会crash
  - 参考：http://stackoverflow.com/questions/29637443/nsinterJYnconsistencyexception-uikeyboardlayoutJYgnmentview
  - 可以直接： ``[[[UIApplication sharedApplication].delegate window] endEditing:YES];``

0. 【强制】禁止使用``drawViewHierarchyInRect`` 截屏
  - 原因：截屏会消耗大内存和耗性能，不建议使用该技术方案.	
  - 推荐使用 ``snapshotViewAfterScreenUpdates``

0. 【推荐】不建议将`UIView`类的对象加入到`NSDictionary`, `NSSet`,如有需要可以添加到`NSMapTable` 和 `NSHashTable`。
	- `NSDictionary`,`NSSet`会对加入的对象做`strong`引用，而`NSMapTable`、`NSHashTable`会对加入的对象做`weak`引用。
	
### Category
0. 【强制】category方法加自定义前缀。防止与其它人冲突。

   <span style="color:green">正例：</span>
	
		@interface NSString(category)
		- (NSString*)JY_stripWhiteSpace;
		@end
   <span style="color:red">反例：</span>

		@interface NSString(category)
		- (NSString*)stripWhiteSpace;
		@end
0. 【强制】禁止category方法覆盖系统方法，防止出现方法调用的不确定性
0. 【推荐】对于一些提供category的工具库，建议根据不同类型功能拆分成不同的子bundle，方便引用方按需引用，控制App体积
0. 【强制】Category的源文件名称必须是“类名+扩展名.{h,m}”

   <span style="color:green">正例：</span>
	
		NSString+JYCategory.h
	
   <span style="color:red">反例：</span>

		NSStringJYCategory.h
		NSString_JYCategory.h

### 异常
0. 【强制】不要在@finally块中使用return或者@throw等导致方法执行中断的语句，会导致@try内的return失效


### 其它

0. 【推荐】使用Method swizzle之前考虑是否有其他方法可以代替，禁止swizzle其他基础库，二方三方库的方法

0. 【强制】`NSNotification`接口，`userInfo`和`object`的使用要规范。
	
	说明：`object`通常是指发出`notification`的对象，如果在发送`notification`的同时要传递一些信息，请使用`userInfo`,而不是`object`.

0. 【推荐】在使用固定格式的`dateFormatter`时候，需要设置`setLocale`为`"en_US_POSIX"`，防止一些不同日历下格式异常，

	示例：
	
	```
	NSDate* now = [NSDate date];
	NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
	fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
	NSString* string = "1996-12-19T16:39:57-08:00";
	NSDate* date = fmt.dateFromString(string);
	```

0. 【推荐】在使用`CTTelephonyNetworkInfo`的时候，务必使用全局的单例实例，这个类本身存在bug，如果有多实例会存在会导致小概率的crash。
0. 【强制】调用block时务必判断block是否为nil
0. 【推荐】调用delegate的optional方法时，判断delegate能否响应该方法，避免crash
0. 【强制】禁止访问对象的结构体变量（使用->）
0. 【强制】需要使用磁盘缓存的业务，务必提供清理缓存的能力


0. 【强制】对于不确定对象类型的比较，可以使用`isEqual:`方法，其会对类型进行判断；对于确定对象类型的比较，比如`NSString`，可以使用`isEqualToString：`，其不对类型进行判断，但相比前者性能更好。

# 三、工程规约

### 版本管理规约

0. 【建议】遵循语义化版本号规范，版本格式：主版本号.次版本号.修订号，版本号递增规则如下：

  - 主版本号：当你做了不兼容的 API 修改，

  - 次版本号：当你做了向下兼容的功能性新增，

  - 修订号：当你做了向下兼容的问题修正。

  - 先行版本号及版本编译信息可以加到“主版本号.次版本号.修订号”的后面，作为延伸。

0. 【建议】App灰度使用四位版本号

0. 【建议】业务方维护自己业务SDK的版本号，不要使用主App的版本号来做业务逻辑判断，如果有需要可以使用业务SDK的版本号来判断

### 分支管理
0. 【建议】主分支Master

  代码库应该有一个、且仅有一个主分支。所有提供给用户使用的正式版本，都在这个主分支上发布。

0. 【建议】开发分支Develop

  日常开发分支在Develop,如果想正式对外发布，就在Master分支上，对Develop分支进行"合并"（merge）。

0. 【建议】临时性分支，按不同的需求，开启相应的临时分支，使用完以后，应该删除

  - 功能（feature）分支

  - 预发布（release）分支

  - 修补bug（fixbug）分支

0. 【强制】每次版本发布之后，都应该在代码仓库中对应的节点添加tag，保证版本的可回溯

0. 【参考】在 Git 提交时可以使用 `[添加]`，`[修改]`，`[删除]`，`[修复]`，`[更新]`等前缀词语来表明当前的 Commit 信息。


### 包管理
0. 【参考】可以使用CocoaPods作为包管理工具
0. 【参考】可以使用[TaobaoEnv](http://gitlab.JYbaba-inc.com/PodEnv/package-taobao-environment)来进行本地打包、发布
0. 【强制】检查podspec的resource选项，不要把Podfile、podspec、InfoPlist.strings、Info.plist或者源文件等导出到使用方的工程中


# 四、Swift规约

#### 语言规约

##### 命名规范

0. 【强制】Swift并不需要使用`;`结束一行代码。

0. 【推荐】变量命名多参考苹果库或者优秀的开源库的命名方式。比如Swift 3.0开始，枚举类型首字母都改成小写，去掉了冗余信息，比如`UIColor.redColor`变成`UIColor.red`。argument label也去掉了冗余信息，变得非常简洁。
	```
	//Swift 2.3
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
	
	//Swift 3.0，cellForRowAtIndexPath简化成cellForRowAt。
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
	```

0. 【强制】虽然Swift命名倾向于不加任何前缀，但是仍然强制所有的自定义类型加上一个统一的前缀，比如阿里云App统一使用`ALY`。

0. 【强制】extension跟Objective-C一样，函数必须加一个前缀，比如`aly_loadImage`，便于理解和使用。不同的模块给同一个类增加相同命名的扩展，编译链接都不会有问题。但是如果同时import这些模块，调用同名的扩展方法会报下面这个错误。
    ```
    main.swift:10:5: error: 'test' is inaccessible due to 'internal' protection level
    str.test()
    ^
    <unknown>:0: note: 'test' declared here
    <unknown>:0: note: 'test' declared here
    ```
0. 【强制】专有名词，如`ECS`，使用大写，即使出现在方法和属性中。

##### 代码组织

0. 【推荐】相同逻辑代码、同一个protocol函数的实现等，比如使用`//MARK: ALYUIViewControllerRefreshDataProtocol`标记，方便阅读代码。

0. 【推荐】类的属性使用`lazy var`实现，并且放到class的后面，方便阅读代码。
	```
    lazy var textLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.aly_f10
        label.textColor = UIColor.aly_ct_2
        label.textJYgnment = .center
        label.text = "添加"
        self.contentView.addSubview(label)

        return label
    }()
	```

#### 最佳实践

##### 消除警告

0. 【强制】在`Build Settings`里面找到`Swift Compiler - Warning Policies`，将`Treat Warning as Erros`设置为`Yes`，Swift这个设置跟Objective-C不在一起，消除一切编译警告非常有必要。

0. 【强制】返回值不需要强制使用的，请使用`@discardableResult`关键字，否则会产生warning。
    ```
    @discardableResult
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        return SessionManager.default.request(urlRequest)
    }
    ```

##### 避免严重的崩溃

0. 【推荐】不要强解Optional类型。强解非常危险，刚开始使用Swift开发非常容易在这块犯错误，导致crash率居高不下。可以通过`guard let`、`if let`、`??`来避免强解。
	```
	//guard let适合后面有大量代码依赖foo有值
	guard let _foo = foo else {
	    return
	}
	
	print(_foo)
	
	//if let比较灵活
	if let _foo = foo {
	    //do something
	}
	
	//??更加灵活，但是一行代码使用过多??可能有性能问题。
	print(foo?? "hello world")
	```

##### 避免内存泄露

0. 【强制】闭包使用`weak`或者`unowned`避免循环依赖。如果明确外部变量在执行代码的过程中，不会变成nil，那么使用`unowned`，比如视觉元素的lazy代码块中。网络接口的回调是异步的，回调发生时，页面可能已经不存在了，这种场景下，需要使用`weak`。
    ```
    let cell = ALYCommonCellObject.Builder()
        .title(title: "使用许可协议", color: UIColor.aly_black)
        .selectionAction(select: { [unowned self] (cell) in
            self?.utlogCounter("Setting", withMonitorPoint: "TermOfService")
        })
        .build()
    ```

0. 【强制】deinit里面要移除对所有通知和KVO的观察。

##### 合理选择数据类型

0. 【推荐】尽量使用Swift的类型，而非Objective-C的桥接类型，比如使用`URL`而非`NSURL`，`IndexPath`而非`NSIndexPath`。

0. 【参考】数据对象尽量使用struct，而非class。struct是Swift的基础类型，翻看苹果的基础库，可以发现所有的基础类型，比如Int、String等类型都是struct。

0. 【强制】Swift支持字符串枚举类型，表达清晰，不易犯错，是一个非常好用的功能。
	```
	enum ALYVote : String {
	    case approve = "approve"
	    case clean   = "clean"
	    case oppose  = "oppose"
	}
	```

0. 【强制】Swift 3.0新增了Decimal类型，使用的便捷性比之前桥接的NSDecimalNumber有质的飞越，需要使用高精度的场景，比如跟钱有关系的，一定要使用Decimal。
    ```
    let foo : Decimal = 10.12373223423
    let bar : Decimal = 1.23423432432432

    print(foo+bar) //11.3579665585543176192
    print(foo-bar) //11.3579665585543176192
    print(foo*bar) //12.4950578137552000654026872358296354816
    ```

##### 合理选择修饰符

0. 【推荐】函数和类的声明采用最小够用使用原则，加上private、final、open、public、internal(默认)等修饰符。
    1. 函数使用final修饰会走静态分发，性能更好。
    2. private修饰则不向外暴露，编译器优化可做内联。final和private都可以减少Xcode自动提示的信息量，提高Xcode的反应速度，好处多多。
    3. 对于动态库暴露的类，`open`表示可以被继承的接口，`public`表示不能被继承的接口。明确不需要被外部继承使用的，请使用`public`关键字。

0. 【参考】关键的Swift代码，如果考虑未来需要打hotpatch，那么接口可以使用`dynamic`修饰，走Objective-C的动态派发。详情请参考：[Hotpatch对于Swift的支持](https://www.atatech.org/articles/65104)。

##### 使用尾随闭包

0. 【强制】如果函数接受一个闭包作为参数，那么将闭包放在最后一个位置，方便用户采用最简方式调用。

0. 【推荐】使用闭包的最简调用方式。
    ```
    //最复杂版本
    let fullGreetings = guestList.map({(person: String) -> String in return "Hello, \(person)!"})

    //最简单版本
    let fullGreetings = guestList.map{ "Hello, \($0)!" }
    ```

##### 使用Swift的新方式

0. 【强制】统一使用下面这种单例的编写方式，非常简洁，混编的时候也能被Objective-C识别。
	```
	class ALYXXX {
	    static let sharedInstance = ALYXXX()
	    private override init() {}
	}
	```

0. 【推荐】多用`lazy var`声明属性，代码紧凑、好看、好维护。
	```
    lazy var textLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.aly_f10
        label.textColor = UIColor.aly_ct_2
        label.textJYgnment = .center
        label.text = "添加"
        self.contentView.addSubview(label)

        return label
    }()
	```

0. 【推荐】`foreach`遍历数组非常简洁美观。map、filter能用的也尽量用起来吧。
    ```
    self.groupList.forEach { (id, name) -> Void in
        vc.groupList[id] = name
    }
    ```

0. 【推荐】`defer`可以简化异常处理逻辑，在作用域结束的时候，会执行`defer`代码块。
    ```
    if exists(filename) {
        let file = open(filename, O_READ)

        defer close(file)

        while let line = try file.readline() {
            //
        }
    }
    ```

##### 优秀的Swift开发资源

0. 【推荐】尽量采用Swift开源库，减少混编的场景。

0. 【推荐】Swift处理JSON不是一件容易的事情，推荐使用[HandyJSON](https://github.com/JYbaba/handyjson)。我们从Swift 2.x一直用到3.0，非常稳定且好用。

0. 【推荐】[ObjectMapper](https://github.com/Hearst-DD/ObjectMapper)是比较传统的JSON解析方式。如果场景比较简单，也是不错的选择。

0. 【推荐】使用[SnapKit](https://github.com/SnapKit/SnapKit)写AutoLayout约束。

#### Swift与Objective-C混编

0. 【强制】Swift不支持宏，所以要使用变量。
	```
	//#define NW_NETWOEK_STATUS_NOTIFY @"TBNetworkStatusChangeNotify"
	extern NSString* const NW_NETWOEK_STATUS_NOTIFY;
	```

0. 【强制】Objective-C使用`typedef enum`定义的枚举类型，Swift不能使用，需要使用`NS_ENUM`或者`NS_OPTIONS`。
	```
	//typedef enum {
	typedef NS_ENUM(NSUInteger, NetworkStatus) {
	    NotReachable = 0,
	    ReachableViaWiFi,
	    ReachableVia2G,
	    ReachableVia3G,
	    ReachableVia4G
	};
	//} NetworkStatus;
	```

0. 【强制】构造函数务必返回`instanceType`。如果返回id，Swift必须要转型才能使用。
    ```
    //返回id，在Swift就必须要转型了。
    //+ (id)sharedInstantce;
    //(TBLoginCenter.sharedInstantce() as? LoginProtocol)

    //使用instanceType符合规范
    + (instanceType)sharedInstantce;
    ```

0. 【推荐】合理使用Nullability Annotations，让Swift更加理解Objective-C的语义。
    ```
    - (__nullable id)itemWithName:(NSString * __nonnull)name;

    //NS_ASSUME_NONNULL_BEGIN和NS_ASSUME_NONNULL_END将中间的代码都加上nonull，
    //只需要对nullable的属性和参数单独声明就好了。
    //iOS SDK惯用这种方法。可以多跳进去看看。
    NS_ASSUME_NONNULL_BEGIN
    @interface Foo : NSObject
    @property (nonatomic, copy, nullable) NSString *bar1;
    @property (nonatomic, copy) NSArray *bar2;
    @end
    NS_ASSUME_NONNULL_END
    ```

##### 显著的坑

0. `open lazy var`和`WMO`Swift 3.0上会冲突，出现编译报错。如果不需要被继承，使用public。如果需要被继承，不采用WMO或不使用open关键字。
    ```
    //可能会出现编译问题
    open lazy var promptTitleLabel : UILabel = {
        let label = UILabel()

        return label
    }()
    ```

0. weak delegate需要使用class关键字。否则会报如下的错误：`'weak' cannot be applied to non-class type 'MyClassDelegate'`。这是因为 Swift 的 protocol 是可以被除了 class 以外的其他类型遵守的，而对于像 struct 或是 enum 这样的类型，本身就不通过引用计数来管理内存，所以也不可能用 weak 这样的 ARC 的概念来进行修饰。
    ```
    protocol MyClassDelegate: class {
        func method()
    }
    
    class MyClass {
        weak var delegate: MyClassDelegate?
    }

    class ViewController: UIViewController, MyClassDelegate {
        // ...
        var someInstance: MyClass!

        override func viewDidLoad() {
            super.viewDidLoad()

            someInstance = MyClass()
            someInstance.delegate = self
        }

        //...
    }
    ```

0. 用private修饰的类，如果使用KVC来给属性设置值，编译不会报错，运行时也不会报错，但就是设置不上。去掉private就好了。

0. Swift和OC混着写的时候，有时候会出现OC的类在CloudConsoleApp-Bridging-Header.h里面提供给Swift使用，但是这个类又需要引入CloudConsoleApp-Swift.h使用Swift的一些功能，这样就循环包含了，没法玩下去了。

0. Swift的二进制兼容做的尤其差，如果向外输出二进制库的话，增加、删除属性；新增、删除、调整接口顺序，都会导致二进制不兼容，需要更新主版本号。


# 五、Show Me The Code!

千言万语，不如直接看代码。这里我们简单写了一个Demo，用于展示规约中比较常见的一些条款的应用。

```objective-c

#import <Foundation/Foundation.h>

/**
 性别的枚举值

 - JYPersonGenderMale: 男人
 - JYPersonGenderFemale: 女人
 - JYPersonGenderUnknown: 不知道是男是女
 */
typedef NS_ENUM(NSInteger, JYPersonGender) {
    JYPersonGenderMale,
    JYPersonGenderFemale,
    JYPersonGenderUnknown
};

/**
 人的基本类型
 */
@interface JYPerson : NSObject

/**
 名称
 */
@property(nonatomic, copy, nonnull) NSString *name;

/**
 性别
 */
@property(nonatomic, assign) JYPersonGender gender;

/**
 初始化方法

 @param aName 人的名字
 @param aGender 人的性别
 @return 返回人的实例
 */
- (nonnull instancetype)initWithName:(nonnull NSString *)aName gender:(JYPersonGender)aGender;

@end


/**
 一个人的体育运动
 */
@interface JYPerson (Sports)

/**
 扩展方法强调要有前缀，以免冲突
 */
- (void)alPlayBasketBallWithPerson:(nullable JYPerson *)person;

@end

/**
 程序员常用的语言枚举
 
 - JYCoderLanguagesJava: Java
 - JYCoderLanguagesC: C语言
 - JYCoderLanguagesCPP: C++
 - JYCoderLanguagesJavaScript: JavaScript
 - JYCoderLanguagesPHP: PHP是世界上最好的语言
 - JYCoderLanguagesRuby: ruby
 - JYCoderLanguagesPython: python
 - JYCoderLanguagesOC: Objective-C
 */
typedef NS_OPTIONS(NSUInteger, JYCoderLanguages){
    JYCoderLanguagesNone = 0,
    JYCoderLanguagesJava = 1 << 0,
    JYCoderLanguagesC = 1 << 1,
    JYCoderLanguagesCPP = 1 << 2,
    JYCoderLanguagesJavaScript = 1 << 3,
    JYCoderLanguagesPHP = 1 << 4,
    JYCoderLanguagesRuby = 1 << 5,
    JYCoderLanguagesPython = 1 << 6,
    JYCoderLanguagesOC = 1 << 7
};

/**
 程序员的基本协议
 */
@protocol JYCoderProtocol <NSObject>

/**
 对大家说一句helloworld

 @return 具体的helloworld内容
 */
- (nonnull NSString *)sayHelloWorld;


/**
 喜欢的语言

 @return 具体的语言，这里为了做事例用了mask
 */
- (JYCoderLanguages)preferLanguages;

@end

//Notification消息使用全局的 NSString 对象进行标识，其名称按如下的方式组合:
//[Name of associated class] + [Did | Will] + [UniquePartOfName] + Notification
//程序员即将写出一个bug的通知
extern NSString * _Nonnull const JYChinaCoderWillWriteBugsNotification;
//程序员已经制造了一个bug的通知
extern NSString * _Nonnull const JYChinaCoderDidWriteBugsNotification;

/**
 程序员的代理，主要负责在程序员要写出bug的时候告诉代理，让代理处理下，是否要修复bug，或者打醒程序员
 */
@protocol JYChinaCoderDelegate <NSObject>

/**
 程序员即将写出bug的回调

 @param coder 程序员本身
 @param partner 程序员的搭档
 */
- (void)coder:(nonnull JYPerson<JYCoderProtocol> *)coder willWriteBugsWithPartner:(nullable JYPerson<JYCoderProtocol> *)partner;

/**
 程序员已经写出bug的回调

 @param coder 程序员本身
 @param partner 程序员的搭档，我们一般认为跟妹子一起，由于程序员喜欢装逼，更容易写出bug
 */
- (void)coder:(nonnull JYPerson<JYCoderProtocol> *)coder didWriteBugsWithPartner:(nullable JYPerson<JYCoderProtocol> *)partner;


@end

/**
 中国程序员
 */
@interface JYChinaCoder : JYPerson<JYCoderProtocol>

@property(nonatomic, weak, nullable) id<JYChinaCoderDelegate> delegate;
/**
 结对编程

 @param partner 一起编程的程序员
 */
- (void)pairProgrammingWithPartner:(nullable JYPerson<JYCoderProtocol> *)partner;

@end

/**
 美国程序员
 */
@interface JYUSACoder : JYPerson<JYCoderProtocol>

@end


```

```objective-c

#import "JYPerson.h"

@implementation JYPerson

#pragma mark - Life Cycle

- (instancetype)initWithName:(NSString *)aName gender:(JYPersonGender)aGender{
    if (self = [super init]) {
        _name = aName;
        _gender = aGender;
    }
    return self;
}

@end

NSString * const JYPersonNameYaoMing = @"姚明";

@implementation JYPerson (Sports)

- (void)alPlayBasketBallWithPerson:(JYPerson *)person{
    if ([person.name isEqualToString:JYPersonNameYaoMing]) {
        NSLog(@"把球给我，我要回家！");
    }else{
        NSLog(@"看我装逼看我飞");
    }
}

@end

//尽量声明变量而非用宏
NSString * const JYChinaCoderNameNotFound = @"没人跟你说你好世界";

NSString * const JYChinaCoderWillWriteBugsNotification = @"ALChinaCoderWillWriteBugsNotification";
NSString * const JYChinaCoderDidWriteBugsNotification = @"ALChinaCoderDidWriteBugsNotification";

@implementation JYChinaCoder

#pragma mark - ALCoderProtocol

- (NSString *)sayHelloWorld{
    if (!self.name) {
        return JYChinaCoderNameNotFound;
    }
    return [NSString stringWithFormat:@"%@说你好世界",self.name];
}

- (JYCoderLanguages)preferLanguages{
    return JYCoderLanguagesOC|JYCoderLanguagesJava|JYCoderLanguagesC;
}

#pragma mark - public

- (void)pairProgrammingWithPartner:(JYPerson<JYCoderProtocol> *)partner{
    switch (partner.gender) {
        case JYPersonGenderMale: {
            NSLog(@"我去。。");
            break;
        }
        case JYPersonGenderFemale: {
            [[NSNotificationCenter defaultCenter] postNotificationName:JYChinaCoderWillWriteBugsNotification object:self];
            [self.delegate coder:self willWriteBugsWithPartner:partner];
            NSLog(@"哦也。。");
            NSLog(@"看我手把手教妹子写代码");
            [[NSNotificationCenter defaultCenter] postNotificationName:JYChinaCoderDidWriteBugsNotification object:self];
            [self.delegate coder:self didWriteBugsWithPartner:partner];
            break;
        }
        default: {
            NSLog(@"看情况再说。。");
            break;
        }
    }
}

@end

NSString * const JYUSACoderNameNotFound = @"No one say hello world";

@implementation JYUSACoder

#pragma mark - JYCoderProtocol

- (NSString *)sayHelloWorld{
    if (!self.name) {
        return JYUSACoderNameNotFound;
    }
    return [NSString stringWithFormat:@"%@ say Hello World",self.name];
}

- (JYCoderLanguages)preferLanguages{
    return JYCoderLanguagesPHP;
}


@end

```
# 六、参考文档
- [苹果开发规约](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CodingGuidelines/Articles/APIAbbreviations.html#//apple_ref/doc/uid/20001285-BCIHCGAE )
- [语义化版本](http://semver.org/lang/zh-CN/)
- [Git分支管理策略](http://www.ruanyifeng.com/blog/2012/07/git.html)
- [禅与 Objective-C 编程艺术](https://github.com/oa414/objc-zen-book-cn#%E5%B1%9E%E6%80%A7%E5%AE%9A%E4%B9%89)
- [iOS Good Practices](https://github.com/futurice/ios-good-practices) 
- [Objective-C style guide](https://github.com/raywenderlich/objective-c-style-guide)
- [如何维护更新日志](http://keepachangelog.com/zh-CN/0.3.0/)
- [纽约时报移动团队 Objective-C 规范指南](https://github.com/NYTimes/objective-c-style-guide/blob/master/README_zh-Hans.md)
- [Raywenderlich.com Swift Style Guide](https://github.com/raywenderlich/swift-style-guide)
- [Github swift style guide](https://github.com/github/swift-style-guide)
- [Linkedin Swift Style Guide](https://github.com/linkedin/swift-style-guide)
- [2015 Objective-C 新特性](http://blog.sunnyxx.com/2015/06/12/objc-new-features-in-2015/)