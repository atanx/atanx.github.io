% ����book����bookӵ�����ƺͼ۸�����
b = Book('��matlab���ŵ���ͨ��', 99);

% book��Ӽ۸�䶯�¼�����
b.addlistener('BookPriceChanged', @onBookPriceChanged);

% �鿴book��Ϣ
info = b.getInfo();
disp(info);   

% book�۸�䶯��set.price��ִ�С�
b.price = 80;
