classdef  BookPriceEventData < event.EventData
   properties
        old_price;
        new_price;
   end
   
    methods
        function obj = BookPriceEventData(old_price, new_price)
            obj.old_price = old_price;
            obj.new_price = new_price;
        end
    end
    
end