function varargout = colorSelector(varargin)
% COLORSELECTOR MATLAB code for colorSelector.fig
%      COLORSELECTOR, by itself, creates a new COLORSELECTOR or raises the existing
%      singleton*.
%
%      H = COLORSELECTOR returns the handle to a new COLORSELECTOR or the handle to
%      the existing singleton*.
%
%      COLORSELECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COLORSELECTOR.M with the given input arguments.
%
%      COLORSELECTOR('Property','Value',...) creates a new COLORSELECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before colorSelector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to colorSelector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help colorSelector

% Last Modified by GUIDE v2.5 25-Aug-2019 19:52:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @colorSelector_OpeningFcn, ...
                   'gui_OutputFcn',  @colorSelector_OutputFcn, ...
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


% --- Executes just before colorSelector is made visible.
function colorSelector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to colorSelector (see VARARGIN)

% Choose default command line output for colorSelector
handles.output = hObject;
handles.choose = [0, 0, 0];
imshow(ones(500,500,3))
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes colorSelector wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = colorSelector_OutputFcn(hObject, eventdata, handles) 
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
colorImage =ColorImage(10,10,50,50,[1,1, 0]);
colorImage.setChoose(handles.choose);
%gca(handles.axes1);
colorImage.plot(true);
handles.colorImage = colorImage;
guidata(hObject, handles);

% --- Executes on button press in checkboxRed.
function checkboxRed_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxRed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    choose = handles.choose;
    choose(1) =  get(hObject, 'Value');
    handles.colorImage.setChoose(choose);
    if(any(choose))
      handles.colorImage.plot(false);
    else
        handles.colorImage.plot(true);
    end
    handles.choose = choose;
    guidata(hObject, handles);
    
    
% Hint: get(hObject,'Value') returns toggle state of checkboxRed


% --- Executes on button press in checkboxGreen.
function checkboxGreen_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxGreen (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choose = handles.choose;
    choose(2) =  get(hObject, 'Value');
    handles.colorImage.setChoose(choose);    
    if(any(choose))
      handles.colorImage.plot(false);
    else
        handles.colorImage.plot(true);
    end
    handles.choose = choose;
    guidata(hObject, handles);
    
% Hint: get(hObject,'Value') returns toggle state of checkboxGreen


% --- Executes on button press in checkboxBlue.
function checkboxBlue_Callback(hObject, eventdata, handles)
% hObject    handle to checkboxBlue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    choose = handles.choose;
    choose(3) =  get(hObject, 'Value');
    handles.colorImage.setChoose(choose);
        if(any(choose))
      handles.colorImage.plot(false);
    else
        handles.colorImage.plot(true);
    end
    handles.choose = choose;
    guidata(hObject, handles);
    
% Hint: get(hObject,'Value') returns toggle state of checkboxBlue
