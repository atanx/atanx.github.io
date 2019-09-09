function varargout = barcode(varargin)
% BARCODE MATLAB code for barcode.fig
%      BARCODE, by itself, creates a new BARCODE or raises the existing
%      singleton*.
%
%      H = BARCODE returns the handle to a new BARCODE or the handle to
%      the existing singleton*.
%
%      BARCODE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BARCODE.M with the given input arguments.
%
%      BARCODE('Property','Value',...) creates a new BARCODE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before barcode_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to barcode_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help barcode

% Last Modified by GUIDE v2.5 31-Aug-2019 15:53:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @barcode_OpeningFcn, ...
                   'gui_OutputFcn',  @barcode_OutputFcn, ...
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


% --- Executes just before barcode is made visible.
function barcode_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to barcode (see VARARGIN)

% Choose default command line output for barcode
handles.output = hObject;
%% 调用BarcodeLib库
warning off  
p = fullfile(cd, 'BarcodeLib.dll');
handles.asm = NET.addAssembly(p);
encoder = BarcodeLib.Barcode();
encoder.IncludeLabel = true;
handles.encoder = encoder;  % 编码器 im = encoder.Encode('helloworld')
handles.CODE_TYPES = struct('CODE128', BarcodeLib.TYPE.CODE128, 'CODE39', BarcodeLib.TYPE.CODE39, 'EAN13', BarcodeLib.TYPE.EAN13);

warning on
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes barcode wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = barcode_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
content = get(handles.edit1, 'string');
code_type = handles.popupmenu1.String{handles.popupmenu1.Value};
code_type = handles.CODE_TYPES.(code_type);
handles.encoder.Width = ceil(length(content)/7*300);
im = handles.encoder.Encode(code_type, content); % 生成条码
im.Save('tmp.jpg'); % 保存临时文件
handles.im = im;    % 保存im对象，用于用户存图片
imshow('tmp.jpg', 'parent', handles.axes1); % 预览条码
guidata(hObject, handles);


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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f, p] = uiputfile('*.jpg', '保存条码文件到');
if f
   new_name = [p f];
   handles.im.Save(new_name);
end



function editBatchFile_Callback(hObject, eventdata, handles)
% hObject    handle to editBatchFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editBatchFile as text
%        str2double(get(hObject,'String')) returns contents of editBatchFile as a double


% --- Executes during object creation, after setting all properties.
function editBatchFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editBatchFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f p] = uigetfile('*.txt');
if f
        filename= fullfile(p, f);
        handles.editBatchFile.String = filename;
        
end
guidata(hObject, handles);

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
code_type = handles.popupmenu1.String{handles.popupmenu1.Value};
code_type = handles.CODE_TYPES.(code_type);

data = readfile(handles.editBatchFile.String); 

p = fullfile(cd, 'data');
if(~exist(p, 'dir'))
    mkdir(p);
end
for i = 1 : length(data)
    content = data{i};
    handles.encoder.Width = ceil(length(content)/7*300);
   im = handles.encoder.Encode(code_type, content);
   code_file = fullfile(cd, 'data', [content, '.jpg']);
   im.Save(code_file);
end
imshow(code_file, 'parent', handles.axes1);
handles.statusLabel.String = ['批量生成', num2str( length(data)) ,'个条码'];
guidata(hObject, handles);
