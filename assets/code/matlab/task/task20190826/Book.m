classdef Book < handle
    
  properties
      name;
  end
  
  methods
      function obj = Book(name)
         obj.name = name; 
      end
      function n = getName(obj)
         n = obj.name; 
      end
  end
end