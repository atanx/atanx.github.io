% 创建book对象，book拥有名称和价格属性
b = Book('《matlab入门到精通》', 99);

% book添加价格变动事件监听
b.addlistener('BookPriceChanged', @onBookPriceChanged);

% 查看book信息
info = b.getInfo();
disp(info);   

% book价格变动，set.price被执行。
b.price = 80;
