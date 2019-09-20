function varargout = tabGUI(varargin)
% TABGUI MATLAB code for tabGUI.fig
%      TABGUI, by itself, creates a new TABGUI or raises the existing
%      singleton*.
%
%      H = TABGUI returns the handle to a new TABGUI or the handle to
%      the existing singleton*.
%
%      TABGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TABGUI.M with the given input arguments.
%
%      TABGUI('Property','Value',...) creates a new TABGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tabGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tabGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tabGUI

% Last Modified by GUIDE v2.5 20-Sep-2019 12:04:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tabGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @tabGUI_OutputFcn, ...
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

function choose_tab(hObject, handles, idx)
    % ���ܣ��л�tabҳ��  ÿһ��tabҳ����һ��tab��ť��һ��uibuttongroup��
    %            idx��ѡ��1��2
    %             tab ����±����1-n������һ��figureҳ����ʹ��һ��tabѡ���
    % hObject: 
    % handles: 
    % 
    tab_num = handles.tabs;
    for i = 1:tab_num
        button= handles.(['tab', num2str(i)]);                       % һ�����ܰ�ť
        group = handles.(['uibuttongroup', num2str(i)]);   % ����������
        P = get(handles.uipanel1, 'Position');          
        set(group, 'Position', [0 0 P(3) P(4)]);                % ��󻯶���������λ��
        group.HighlightColor = [0.94 0.94 0.94];        % �������������������ɫ
        group.ShadowColor = [0.94 0.94 0.94];          % ����������������Ӱ��ɫ
        if (i==idx)                                            %  ѡ�е�ѡ�
            button.BackgroundColor = [1 1 1];                 % ����һ�����ܰ�ť
            group.Visible = 'on';                                              % ��ʾ����������
        else 
            button.BackgroundColor = [0.94 0.94 0.94];  % �ر�δѡ����һ�����ܰ�ť
            group.Visible = 'off';                                               % ����δѡ���Ķ��������� 
        end 
    end 
  guidata(hObject, handles);   % ����������
  
  
% --- Executes just before tabGUI is made visible.
function tabGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tabGUI (see VARARGIN)

% Choose default command line output for tabGUI
handles.output = hObject;
handles.tabs = 3;

guidata(hObject, handles);

choose_tab(hObject, handles,1);                              

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tabGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tabGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in tab1.
function tab1_Callback(hObject, eventdata, handles)
% hObject    handle to tab1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  choose_tab(hObject, handles, 1);

% --- Executes on button press in tab2.
function tab2_Callback(hObject, eventdata, handles)
% hObject    handle to tab2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA) 

  choose_tab(hObject, handles, 2);
  
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
v = get(hObject, 'String');
msgbox(v);


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    v = get(hObject, 'String');
    msgbox(v);

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v = get(hObject, 'String');
msgbox(v);
% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton10.
function radiobutton10_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v = get(hObject, 'String');
msgbox(v);
% Hint: get(hObject,'Value') returns toggle state of radiobutton10


% --- Executes on button press in radiobutton11.
function radiobutton11_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v = get(hObject, 'String');
msgbox(v);

% Hint: get(hObject,'Value') returns toggle state of radiobutton11


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v = get(hObject, 'String');
msgbox(v);
% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton5.
function radiobutton5_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v = get(hObject, 'String');
msgbox(v);

% Hint: get(hObject,'Value') returns toggle state of radiobutton5


% --- Executes on button press in radiobutton6.
function radiobutton6_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v = get(hObject, 'String');
msgbox(v);

% Hint: get(hObject,'Value') returns toggle state of radiobutton6


% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on button press in radiobutton12.
function radiobutton12_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v = get(hObject, 'String');
msgbox(v);

% Hint: get(hObject,'Value') returns toggle state of radiobutton12


% --- Executes on button press in tab3.
function tab3_Callback(hObject, eventdata, handles)
% hObject    handle to tab3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choose_tab(hObject, handles, 3);


% --- Executes on button press in radiobutton15.
function radiobutton15_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
v = get(hObject, 'String');
msgbox(v);

% Hint: get(hObject,'Value') returns toggle state of radiobutton15
