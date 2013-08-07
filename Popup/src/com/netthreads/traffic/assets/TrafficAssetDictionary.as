/**
 * -----------------------------------------------------------------------
 * Traffic Event maker lookup dictionary. 
 * 
 * Provides a mechanism to lookup appropriate marker based on severity.
 * 
 * -----------------------------------------------------------------------
 * Alistair Rutherford, www.netthreads.co.uk, Jan 2008.
 * -----------------------------------------------------------------------
 */
package com.netthreads.traffic.assets
{
    import flash.utils.Dictionary;

	public class TrafficAssetDictionary
	{	
        private static var instance : TrafficAssetDictionary = null;  
        
        private var assets:TrafficAssets = null;
        
        /**
        * Texts
        */
        public static var TXT_SEVERITY_UNKNOWN:String = "unknown";
        public static var TXT_SEVERITY_SLIGHT:String = "slight";
        public static var TXT_SEVERITY_MEDIUM:String = "medium";
        public static var TXT_SEVERITY_SEVERE:String = "severe";

        public static var assetDict:Dictionary = null;
	    
	    
        /**
        * Returns the single instance of the dispatcher
        */ 
        public static function getInstance() : TrafficAssetDictionary
        {
            if (instance==null)
                instance = new TrafficAssetDictionary();
              
            return instance;
        }
      	    
	    /**
	    * Ctor
	    */
		public function TrafficAssetDictionary()
		{
			// Make icon assets
            assets = new TrafficAssets();
            
            // Make lookup dictionary
            assetDict = new Dictionary();
            
            init();
		}

        /**
        * Fill assets dictionary
        */
        private function init():void
        {
            assetDict = new Dictionary();
            assetDict[TXT_SEVERITY_UNKNOWN] = assets.marker;
            assetDict[TXT_SEVERITY_SEVERE] = assets.markerSevere;
            assetDict[TXT_SEVERITY_MEDIUM] = assets.markerMedium;
            assetDict[TXT_SEVERITY_SLIGHT] = assets.markerSlight;
        }
        
        /**
        * Returns asset based on defined name, if severity doesn't match
        * a target item then a default it used.
        * 
        */
        public function lookup(severity:String):Class
        {
            var item:Class = null;
            
            try
            {
                item = assetDict[severity];
            }
            catch (e:Error)
            {
                item = assetDict[TXT_SEVERITY_UNKNOWN];
            }
            
            return item;
        }
        
	}

}
