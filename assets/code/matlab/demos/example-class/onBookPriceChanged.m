function onBookPriceChanged(src, eventdata)
    info = sprintf('%s调价了，现价为%.2f!!!', src.name, src.price); 
    disp(info);
    disp(eventdata);
end