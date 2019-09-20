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
         n = sprintf('书籍名称：%s\n %书籍价格：%.2f 元', obj.name, obj.price); 
      end
      
      function out = get.price(obj)
          out = obj.price;
      end
      
      function set.price(obj, value)
        event_data = BookPriceEventData(obj.price, value);
        disp(['book对象的set前价格为', num2str(obj.price)]);
        obj.price = value;
        disp(['book对象的set后价格为', num2str(obj.price)]);
        notify(obj, 'BookPriceChanged', event_data);
      end
  end

  events
     BookPriceChanged; 
  end
end