function o = cb1(src, keydata, s)
    if(length(keydata.Key)==1)
       k = keydata.Key;
       evalin('base',sprintf('f=[f ''%s''];', k));
    end
end