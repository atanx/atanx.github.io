function o = readfile(filename) 
% ���ж����ļ���
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