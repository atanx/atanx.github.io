classdef ColorImage < handle
    
    properties
        xNum;
        yNum;
        width;
        height; 
        blocks;
        choose;
        data =[];
    end
    
    methods
        function obj = ColorImage(xNum, yNum, blockWidth, blockHeight, choose)
           % xNum:横向块数
           % yNum: 纵向块数
           obj.xNum = xNum;
           obj.yNum = yNum;
           obj.width = xNum * blockWidth;
           obj.height = yNum * blockHeight;
           obj.blocks = [];
           obj.choose = choose; 
           for i = 1: xNum
               for j = 1: yNum
                    block =  ColorBlock(i, j, blockWidth, blockHeight, choose);
                    block.refresh();
                    obj.blocks = [obj.blocks, block];
                    
               end
           end
           obj.blocks = reshape(obj.blocks, xNum, yNum);
        end
        
        function setChoose(obj, choose)
            obj.choose = choose;
            obj.getImage(true);
        end
        
        function im =  getImage(obj, isRaw)
            im = zeros(obj.width, obj.height, 3);
            for i = 1: obj.xNum
                for j = 1 : obj.yNum
                    block = obj.blocks(i, j);
                    block.setChoose(obj.choose);
                    blockData = block.getImage(isRaw);
                    X = (1+(i-1)*block.width):i*block.width;
                    Y = (1+(j-1)*block.height):j*block.height;
                    im(X, Y, :) = blockData;
                end
            end
            obj.data = im;
        end
        
        function plot(obj, isRaw)  
            obj.getImage(isRaw);  
            imshow(obj.data);
        end
        
    end
    
end