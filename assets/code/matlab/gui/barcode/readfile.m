function o = readfile(filename) 
% 逐行读入文件。
%%
        fid = fopen(filename);
        o = {}; 
        tline = fgetl(fid);  
        while ischar(tline)
            o{length(o)+1} = tline;
            disp(tline)
            tline = fgetl(fid);
        end
        fclose(fid); 
end