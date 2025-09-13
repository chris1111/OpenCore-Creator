--
-- OpenCoreCreator.applescript Created by chris1111 on 11-9-25.
--  Base on (https://www.sonsothunder.com/devres/revolution/tutorials/StatusMenu.html).
--

property NSBundle : class "NSBundle"
property NSStatusItem : class "NSStatusItem"
property NSString : class "NSString"
property NSImage : class "NSImage"
property NSStatusBar : class "NSStatusBar"


script MenuletAppDelegate
    
    property parent : class "NSObject"
    property setup : false
    property myMenu : missing value
    property theView : missing value
    property textField : missing value
    property spinner : missing value
    property statusItem : missing value
    property AppletIcon : missing value
    property AssistantIcon : missing value
    
    on doMenuStuff:sender --  OpenCoreCréateur
        activate me
        set source to quoted form of POSIX path of (path to resource "OpenCore-Creator")
        do shell script "open " & source
    end doMenuStuff:
    
    on doSomething:sender --  Package
        startSpinner()
        set AlternateImage to quoted form of POSIX path of (path to resource "AlternateImage")
        set source to quoted form of POSIX path of (path to resource "Package")
        performSelector_withObject_afterDelay_("stopSpinner", missing value, 2.5)
        delay 2.5
        do shell script source
        delay 0.1
        do shell script AlternateImage
    end doSomething:
    
    on awakeFromNib()
        set bundle to NSBundle's mainBundle()
        set AppletIcon to NSImage's alloc's initWithContentsOfFile:(bundle's pathForResource:"Applet" ofType:"png")
        set AssistantIcon to NSImage's alloc's initWithContentsOfFile:(bundle's pathForResource:"Assistant" ofType:"png")
        set statusItem to NSStatusBar's systemStatusBar's statusItemWithLength:-1 --
        statusItem's setImage:AppletIcon
        statusItem's setAlternateImage:AssistantIcon
        statusItem's setMenu:myMenu
        statusItem's setToolTip:"StatusMenu"
        statusItem's setHighlightMode:true
    end awakeFromNib
    
    on applicationWillFinishLaunching:aNotification
        
    end applicationWillFinishLaunching:
    
    on applicationShouldTerminate:sender
        return current application's NSTerminateNow
    end applicationShouldTerminate:
    
    on startSpinner()
        setupTitle()
        statusItem's setView:theView
        spinner's startAnimation:me
    end startSpinner
    
    on stopSpinner()
        spinner's stopAnimation:me
        statusItem's setView:(missing value)
        statusItem's setImage:AppletIcon
        statusItem's setAlternateImage:AssistantIcon
    end stopSpinner
    
    on setupTitle()
        if setup then return
        set menuBarFont to current application's NSFont's menuBarFontOfSize:12
        set attributes to current application's NSDictionary's dictionaryWithDictionary:{NSFontAttributeName:menuBarFont, NSParagraphStyleAttributeName:(current application's NSParagraphStyle's defaultParagraphStyle)}
        set theTitle to current application's NSString's stringWithString:" OC Package"
        set titleWidth to ((width of ((theTitle's sizeWithAttributes:attributes) as record)) as integer) + 12
        set textField to current application's NSTextField's alloc's initWithFrame:{{0, 0}, {titleWidth, 22}}
        tell textField # set up textField properties
            setFont_(menuBarFont)
            setStringValue_(theTitle)
            setDrawsBackground_(false)
            setBezeled_(false)
        end tell
        set spinner to current application's NSProgressIndicator's alloc's initWithFrame:{{0, 0}, {16, 16}}
        tell spinner # set up spinner properties
            setControlSize_(current application's NSSmallControlSize)
            setStyle_(current application's NSProgressIndicatorSpinningStyle)
            setUsesThreadedAnimation_(true)
        end tell
        set theView to current application's NSView's alloc's initWithFrame:{{0, 0}, {22 + titleWidth, 22}}
        tell theView # add everything to the view and adjust locations
            addSubview_(textField)
            textField's setFrameOrigin:{22.0, -2.0}
            addSubview_(spinner)
            spinner's setFrameOrigin:{5.0, 4.0}
        end tell
        set setup to true
    end setupTitle
    
end script
