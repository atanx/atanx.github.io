function onBookPriceChanged(src, eventdata)
    info = sprintf('%s�����ˣ��ּ�Ϊ%.2f!!!', src.name, src.price); 
    disp(info);
    disp(eventdata);
end