function varargout = cameraConfig(varargin)
% CAMERACONFIG MATLAB code for cameraConfig.fig
%      CAMERACONFIG, by itself, creates a new CAMERACONFIG or raises the existing
%      singleton*.
%
%      H = CAMERACONFIG returns the handle to a new CAMERACONFIG or the handle to
%      the existing singleton*.
%
%      CAMERACONFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CAMERACONFIG.M with the given input arguments.
%
%      CAMERACONFIG('Property','Value',...) creates a new CAMERACONFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before cameraConfig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to cameraConfig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help cameraConfig

% Last Modified by GUIDE v2.5 11-Sep-2019 10:55:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @cameraConfig_OpeningFcn, ...
                   'gui_OutputFcn',  @cameraConfig_OutputFcn, ...
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


% --- Executes just before cameraConfig is made visible.
function cameraConfig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to cameraConfig (see VARARGIN)

% Choose default command line output for cameraConfig
handles.output = hObject;
handles.img = [];
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes cameraConfig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = cameraConfig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnReset.
function btnReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in popupAngle.
function popupAngle_Callback(hObject, eventdata, handles)
% hObject    handle to popupAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupAngle contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupAngle
 disp(handles.popupAngle.Value);
img = handles.img;
k = handles.popupAngle.Value-1;
img = rot90(img, -k);
handles.img_handle = imshow(img,'parent', handles.axes1);
guidata(hOjbect, handles);


% --- Executes during object creation, after setting all properties.
function popupAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnCrop.
function btnCrop_Callback(hObject, eventdata, handles)
% hObject    handle to btnCrop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[I, rect] = imcrop(handles.img_handle);
disp(rect);
handles.crop_rect = rectangle('Position', rect, 'parent', handles.axes1,'EdgeColor','r', 'lineWidth', 2);
handles.crop_text = text(rect(1),rect(2),'ºÙ≤√«¯”Ú');
handles.editCropInfo.String = num2str(rect);
guidata(hObject, handles);



function editCropInfo_Callback(hObject, eventdata, handles)
% hObject    handle to editCropInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rect = str2num(handles.editCropInfo.String);
handles.crop_rect.Position = rect;
guidata(hObject, handles);

% Hints: get(hObject,'String') returns contents of editCropInfo as text
%        str2double(get(hObject,'String')) returns contents of editCropInfo as a double


% --- Executes during object creation, after setting all properties.
function editCropInfo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editCropInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnDoor.
function btnDoor_Callback(hObject, eventdata, handles)
% hObject    handle to btnDoor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[I, rect] = imcrop(handles.img_handle);
disp(rect);
handles.door_rect = rectangle('Position', rect, 'parent', handles.axes1,'EdgeColor','r', 'lineWidth', 2);
handles.door_text = text(rect(1),rect(2),'√≈«¯”Ú');
handles.editDoorInfo.String = num2str(rect);
guidata(hObject, handles);


function editDoorInfo_Callback(hObject, eventdata, handles)
% hObject    handle to editDoorInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rect = str2num(handles.editDoorInfo.String);
handles.door_rect.Position = rect;
guidata(hObject, handles);
% Hints: get(hObject,'String') returns contents of editDoorInfo as text
%        str2double(get(hObject,'String')) returns contents of editDoorInfo as a double


% --- Executes during object creation, after setting all properties.
function editDoorInfo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editDoorInfo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function file_Callback(hObject, eventdata, handles)
% hObject    handle to file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function open_file_Callback(hObject, eventdata, handles)
% hObject    handle to open_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[f, p] = uigetfile('*.*');
if ~f
    disp([p f]);
end
im = imread([p f]);
h = imshow(im, 'parent', handles.axes1);
handles.img_path = [p f];
handles.img = im;
handles.img_handle = h;
info = imfinfo([p f]);
handles.textImageInfo.String = sprintf('width:%d, height: %d, bitdepth:%d', info.Width, info.Height, info.BitDepth);
guidata(hObject, handles);
