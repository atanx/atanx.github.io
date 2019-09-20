classdef Book < handle
  properties
      name;
      price;
  end 
  
  methods
      function obj = Book(name, price)
         obj.name = name; 
         obj.price = price;
      end
      
      function n = getInfo(obj)
         n = sprintf('�鼮���ƣ�%s\n %�鼮�۸�%.2f Ԫ', obj.name, obj.price); 
      end
      
      function out = get.price(obj)
          out = obj.price;
      end
      
      function set.price(obj, value)
        event_data = BookPriceEventData(obj.price, value);
        disp(['book�����setǰ�۸�Ϊ', num2str(obj.price)]);
        obj.price = value;
        disp(['book�����set��۸�Ϊ', num2str(obj.price)]);
        notify(obj, 'BookPriceChanged', event_data);
      end
  end

  events
     BookPriceChanged; 
  end
end