function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 25-Aug-2019 20:44:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename,pathname]=uigetfile('*.*','��ѡ���ļ���','ѡ���ı��ļ�');%ѡ���ļ����������Ϸ�������
fpath=[pathname filename];                                        %ͨ����ַfpath������ʹ��ѡ�е��ļ���ַ
set( handles.edit1,'String',fpath);                               %��·�����ļ�����ʾ���ı�����

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%�����ж��ļ���ʽ�Ƿ��ܱ�����
filename=get(handles.edit1,'string');  %��ȡedit1�ڵ��ļ���
fid=filename(end-2:end)                %���ļ���ת�����ַ���
a='txt'                                %�����ַ���txt
if strcmp(fid,a)~=1                       %�ж��Ƿ�Ϊtxt�ļ�                               
    warndlg('�ļ���ʽ����','����','modal');%����ַ�����ͬ��������ʽ���洰��
end
id=filename(end-2:end)                %���ļ���ת�����ַ���
a='txt'                                %�����ַ���txt
if strcmp(fid,a)~=1                       %�ж��Ƿ�Ϊtxt�ļ�                               
    warndlg('�ļ���ʽ����','����','modal');%����ַ�����ͬ��������ʽ���洰��
end
filename=get(handles.edit1,'string');%��ȡ�ļ���
fid=fopen(filename,'r');              %�ر��ļ�
str=fread(fid,'char');
cade=num2str(str);
fclose(fid);
mystr=bin2dec(cade)%������תʮ����
x=mystr-1;
a=dec2bin(x);                %���������������1��λ��
b=num2str(a);                    %������ֵת���Ϊ�ַ���
fid=fopen(filename,'w');           %���ļ�
fwrite(fid,b,'char');               %д������
fclose(fid);                         %�ر��ļ�
disp('�ļ�������ϣ�');
          





% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%����
b1=get(handles.edit2,'string');            %��ȡ����
b2='123456'                                %�趨������Կ
if strcmp(b1,b2)~=1                        %�ж���������������Ƿ�һ��
                                           %��ǰ�����벻һ��ʱ
  warndlg('�����������','����','modal');   %��ʾ���洰��
end

filename=get(handles.edit1,'string')
fid=fopen(filename,'r');
str2=fread(fid,'char');
cade2=num2str(str2);
 mystr=bin2dec(cade2);
 y=mystr+1;
 c=dec2bin(y)%������������ǰ��1��λ��                  %����������ת��Ϊ�ַ���
mystrl=num2str(c);
fid=fopen(filename, 'w');            %���ļ���д��
fwrite(fid,mystrl,'char');                %д������
fclose(fid);                           %�ر��ļ�
disp('�ļ�������ϣ�');




function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
password = get( hObject, 'UserData' );
switch eventdata.Key
case 'backspace'
password = password( 1:end-1 );
case 'return'
uiresume;
return;
    otherwise
password = [password eventdata.Character];
end
set( hObject, 'UserData', password );
set( hObject, 'String', char( '*'*sign(password) ) );


% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
