/**
 * @description       : Tests for the Lookup Result class.
 * @author            : Kev Cadger (justKev93)
 * @group             : Testing
 * @last modified on  : 05-08-2021
 * @last modified by  : Kev Cadger (justKev93)
 * Modifications Log
 * Ver   Date         Author                   Modification
 * 1.0   05-08-2021   Kev Cadger (justKev93)   Initial Version
**/
@IsTest
public class TstLookupResult {
    /**
    * @description : Test if the Lookup Result properties are functionaing correctly.
    * @author Kev Cadger (justKev93) | 05-08-2021 
    **/
    @IsTest
    static void testLookupResult() {
        // Initialise a new Lookup Result.
        LookupResult resultA = getLookupResult('title', true);
        LookupResult resultB = getLookupResult('title', false);

        Test.startTest();

        // Assert the Lookup Result has the correct values.
        System.assertEquals('0', resultA.id, 'The id is incorrect.');
        System.assertEquals('lookupresult', resultA.sObjectType, 'The sObjectType is incorrect.');
        System.assertEquals('icon', resultA.icon, 'The icon is incorrect');
        System.assertEquals('standard:default', resultB.icon, 'The icon is incorrect');
        System.assertEquals('title', resultA.title, 'The title is incorrect.');
        System.assertEquals('subtitle', resultA.subtitle, 'The subtitle is incorrect.');
        System.assertEquals('test', resultA.json.get('test'), 'The json property is incorrect.');

        Test.stopTest();
    }

    /**
    * @description : Test if the compareTo method has been implemented correctly.
    * @author Kev Cadger (justKev93) | 05-08-2021 
    **/
    @IsTest
    static void testCompareTo(){
        // Intialise the new Lookup Results.
        LookupResult resultNullA = getLookupResult(null, false);
        LookupResult resultNullB = getLookupResult(null, false);
        LookupResult resultA = getLookupResult('a', false);
        LookupResult resultB = getLookupResult('b', false);
        
        Test.startTest();
        
        // Compare 2 Lookup Results where both titles are null.
        Integer compareNullTitles = resultNullA.compareTo(resultNullB);
        System.assertEquals(0, compareNullTitles, 'The Lookup Results should be the same.');
        // Compare Lookup Result A against Lookup Result B.
        Integer compareNoNullTitles = resultA.compareTo(resultB);
        System.assertEquals(-1, compareNoNullTitles, 'Lookup Result A "a" should come before Lookup Result B "b".');
        // Compare 2 Lookup Results where the first title is null.
        Integer compareFirstTitleNull = resultNullA.compareTo(resultA);
        System.assertEquals(-1, compareFirstTitleNull,'Lookup Result A "null" should come before Lookup Result B "');
        // Compare 2 Lookup Results where the second title is null.
        Integer compareSecondTitleNull = resultA.compareTo(resultNullA);
        System.assertEquals(1, compareSecondTitleNull, 'Lookup Result B should come before Lookup Result A');

        Test.stopTest();
    }
    
    /**
    * @description : Returns a new Lookup Result with the specified values.
    * @author Kev Cadger (justKev93) | 05-08-2021 
    * @param String title 
    * @return LookupResult 
    **/
    private static LookupResult getLookupResult(String title, Boolean hasIcon) {
        // Intiialise the Lookup Result.
        LookupResult result = new LookupResult();
        // Set the Lookup Result properties.
        result.id = '0';
        result.sObjectType = 'lookupresult';
        result.icon = hasicon ? 'icon' : null;
        result.title = title;
        result.subtitle = 'subtitle';
        result.json = getJSON();
        // Return the generated Lookup Result.
        return result;
    }

    /**
    * @description : Returns the JSON object for the Lookup Result.
    * @author Kev Cadger (justKev93) | 05-08-2021 
    * @return Map<String, String> 
    **/
    private static Map<String,String> getJSON() {
        // Initialise the JSON Object.
        Map<String,String> json = new Map<String,String>();
        // Add a property to the JSON Object.
        json.put('test', 'test');
        // Return the JSON Object.
        return json;
    }
}
