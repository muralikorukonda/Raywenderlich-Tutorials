import WatchKit
import Foundation

class PostListController: WKInterfaceController {
    
    @IBOutlet weak var table: WKInterfaceTable!
    override func awakeWithContext(context: AnyObject!) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        NSLog("%@ awake", self)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        NSLog("%@ will activate", self)
        table.insertRowsAtIndexes(NSIndexSet(indexesInRange: NSMakeRange(0, 20)), withRowType: "PostRowType")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        NSLog("%@ did deactivate", self)
        super.didDeactivate()
    }
    
}
