function varargout = zuobiaoxijindutiao(varargin)
% ZUOBIAOXIJINDUTIAO MATLAB code for zuobiaoxijindutiao.fig
%      ZUOBIAOXIJINDUTIAO, by itself, creates a new ZUOBIAOXIJINDUTIAO or raises the existing
%      singleton*.
%
%      H = ZUOBIAOXIJINDUTIAO returns the handle to a new ZUOBIAOXIJINDUTIAO or the handle to
%      the existing singleton*.
%
%      ZUOBIAOXIJINDUTIAO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ZUOBIAOXIJINDUTIAO.M with the given input arguments.
%
%      ZUOBIAOXIJINDUTIAO('Property','Value',...) creates a new ZUOBIAOXIJINDUTIAO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before zuobiaoxijindutiao_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to zuobiaoxijindutiao_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help zuobiaoxijindutiao

% Last Modified by GUIDE v2.5 19-Sep-2019 10:33:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @zuobiaoxijindutiao_OpeningFcn, ...
                   'gui_OutputFcn',  @zuobiaoxijindutiao_OutputFcn, ...
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


% --- Executes just before zuobiaoxijindutiao is made visible.
function zuobiaoxijindutiao_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to zuobiaoxijindutiao (see VARARGIN)

% Choose default command line output for zuobiaoxijindutiao
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes zuobiaoxijindutiao wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = zuobiaoxijindutiao_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%h1=findobj(handles.axes1,'visible','off');%获取按键1的可视化句柄
%set(h1,'visible','on');%设置句柄为可见
mywaitbar(0,'Please Wait...',handles.axes1,handles.figure1);
TheEndTime = 600; 
for t = 1:TheEndTime
       mywaitbar(t/TheEndTime,[num2str(floor(t*100/TheEndTime)),'%'],handles.axes1,handles.figure1);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

h1=findobj(handles.axes2,'visible','off');%获取按键2的可视化句柄
set(h1,'visible','on');%设置句柄为可见
mywaitbar(0,'Please Wait...',handles.axes2,handles.figure1);
TheEndTime= 600; 
for t= 1:TheEndTime
       mywaitbar(t/TheEndTime,[num2str(floor(t*100/TheEndTime)),'%'],handles.axes2,handles.figure1);
end