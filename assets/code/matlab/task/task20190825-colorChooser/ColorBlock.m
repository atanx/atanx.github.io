classdef ColorBlock < handle
    properties
        x;
        y;
        width;
        height;
        color;
        text;
        visible=true;
        borderVisible=false;
        borderColor = reshape([0, 0, 0], 1,1,3);
        choose; % [selectR selectG selectB]
        enableVisibleFlag=true;
        data = [];
        
    end
    
    methods
        function obj = ColorBlock(x,y,width,height, choose)
           obj.x = x;
           obj.y = y;
           obj.width = width;
           obj.height = height;
           obj.color = rand(1,3);
           obj.choose = choose;
        end
        
        function refresh(obj)
             maxColor = obj.color==max(obj.color);
             
             tmp = maxColor .* obj.choose;  % 选中颜色分量
             obj.borderVisible = any(tmp); 
             obj.borderColor = maxColor*255;
             obj.visible = any(tmp);
        end
        
        function setChoose(obj, choose)
           obj.choose = choose;
           obj.refresh(); 
        end
        function randColor(obj) 
                obj.color = reshape(rand(1,3), 1, 1, 3);
        end
        
        function image = getImage(obj, isRaw)
            obj.refresh();
            image = ones(obj.width, obj.height, 3) * 255;
            
            if (isRaw) 
                image(:,:,1) = obj.color(1);
                image(:,:,2)= obj.color(2);
                image(:,:,3) = obj.color(3);
            else
                if(obj.enableVisibleFlag && obj.visible) 
                    image(:,:,1) = obj.color(1);
                    image(:,:,2)= obj.color(2);
                    image(:,:,3) = obj.color(3);
                        if(obj.borderVisible)
                            for z = 1:3
                                image([1:3, end-2:end], :, z) = obj.borderColor(z);
                                image(:, [1:3, end-2:end], z) = obj.borderColor(z);
                            end
                        end 
                end
            end
            
            obj.data = image;
        end
        
        function plot(obj)
           if isempty(obj.data)
              obj.data = obj.getImage(false); 
           end
           imshow(obj.data);
        end
    end

end