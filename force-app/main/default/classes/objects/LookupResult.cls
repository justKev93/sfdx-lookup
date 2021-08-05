/**
 * @description       : Object Class used to display the results for the lookup component.
 * @author            : Kev Cadger (justKev93)
 * @group             : Objects
 * @last modified on  : 05-08-2021
 * @last modified by  : Kev Cadger (justKev93)
 * Modifications Log
 * Ver   Date         Author                   Modification
 * 1.0   04-08-2021   Kev Cadger (justKev93)   Initial Version
**/
public class LookupResult implements Comparable {
    // Declare the properties.
    @AuraEnabled public String id { get; set; }
    @AuraEnabled public String sObjectType { get; set; }
    @AuraEnabled public String icon {
        get {
            return (
                String.isNotBlank(this.icon) 
                ? this.icon 
                : 'standard:default'
            );
        }
        set;
    }
    @AuraEnabled public String title { get; set; }
    @AuraEnabled public String subtitle { get; set; }
    @AuraEnabled public Map<String,String> json { get; set; }

  
    /**
    * @description : Compares a lookup search result to another
    * @author Kev Cadger (justKev93) | 04-08-2021 
    * @param Object lookupResult 
    * @return Integer 
    **/
    public Integer compareTo(Object compareTo) {
        // Convert the compareTo object to a LookupResult type.
        LookupResult that = (LookupResult)compareTo;

        // If both titles are the same.
        if (this.title == that.title) {
            return 0;
        } 
        // Else if this title comes after that title.
        else if (this.title > that.title) {
            return 1;
        } 
        // Else this title comes before that title.
        else {
            return -1;
        }
    }
}