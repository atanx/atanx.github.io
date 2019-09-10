function out = char2string(carray)
    carray = [carray 10*ones(size(carray, 1),1)];
    carray = carray';
    carray = carray(:);
    out = carray';
end