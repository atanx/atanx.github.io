function varargout = gui_1(varargin)
% GUI_1 MATLAB code for gui_1.fig
%      GUI_1, by itself, creates a new GUI_1 or raises the existing
%      singleton*.
%
%      H = GUI_1 returns the handle to a new GUI_1 or the handle to
%      the existing singleton*.
%
%      GUI_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_1.M with the given input arguments.
%
%      GUI_1('Property','Value',...) creates a new GUI_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_1

% Last Modified by GUIDE v2.5 01-Sep-2019 15:41:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_1_OutputFcn, ...
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


% --- Executes just before gui_1 is made visible.
function gui_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_1 (see VARARGIN)

% Choose default command line output for gui_1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_14_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function yuchuli_Callback(hObject, eventdata, handles)
global NUM
% hObject    handle to yuchuli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[NUM,TXT]=xlsread('example');
data2= NUM;   % NUM为数据矩阵，data为需要保存的数据
save data2.mat data2 
data = TXT;   % NUM为数据矩阵，data为需要保存的数据
save data.mat data
stock_Name_Str1=data2(:,1);  
stock_Name_Str2=data2(:,2);  
stock_Name_Str3=data2(:,3);  
stock_Name_Str4=data2(:,4);  
stock_Name_Str5=data2(:,5);  
stock_Name_Str6=data2(:,6);  
stock_Name_Str7=data2(:,7);  
stock_Name_Str8=data2(:,8);  
stock_Name_Str9=data2(:,9);  
stock_Name_Str10=data2(:,10); 
stock_Name_Str11=data2(:,11); 
stock_Name_Str12=data2(:,12); 
stock_Name_Str13=data2(:,13); 
stock_Name_Str14=data2(:,14); 
stock_Name_Str15=data2(:,15); 
stock_Name_Str16=data2(:,16); 
stock_Name_Str17=data2(:,17); 
stock_Name_Str18=data2(:,18); 
stock_Name_Str19=data2(:,19); 
stock_Name_Str20=data2(:,20); 
stock_Name_Str21=data2(:,21); 
stock_Name_Str22=data2(:,22); 
stock_Name_Str23=data2(:,23); 
stock_Name_Str24=data2(:,24); 
stock_Name_Str25=data2(:,25); 
stock_Name_Str26=data2(:,26); 
stock_Name_Str27=data2(:,27); 
stock_Name_Str28=data2(:,28); 
stock_Name_Str29=data2(:,29); 
stock_Name_Str30=data2(:,30); 
stock_Name_Str31=data2(:,31); 
stock_Name_Str32=data2(:,32); 
stock_Name_Str33=data2(:,33); 
stock_Name_Str34=data2(:,34); 
stock_Name_Str35=data2(:,35); 
stock_Name_Str36=data2(:,36); 
stock_Name_Str37=data2(:,37); 
stock_Name_Str38=data2(:,38); 
stock_Name_Str39=data2(:,39); 
stock_Name_Str40=data2(:,40); 
stock_Name_Str41=data2(:,41); 
stock_Name_Str42=data2(:,42); 
stock_Name_Str43=data2(:,43); 
stock_Name_Str44=data2(:,44); 
stock_Name_Str45=data2(:,45); 
stock_Name_Str46=data2(:,46); 
stock_Name_Str47=data2(:,47); 
stock_Name_Str48=data2(:,48); 
stock_Name_Str49=data2(:,49); 
stock_Name_Str50=data2(:,50); 

stock_Name_Str51=data2(:,51); 
stock_Name_Str52=data2(:,52); 
stock_Name_Str53=data2(:,53); 
stock_Name_Str54=data2(:,54); 
stock_Name_Str55=data2(:,55); 
stock_Name_Str56=data2(:,56); 
stock_Name_Str57=data2(:,57); 
stock_Name_Str58=data2(:,58); 
stock_Name_Str59=data2(:,59); 
stock_Name_Str60=data2(:,60); 
stock_Name_Str61=data2(:,61); 
stock_Name_Str62=data2(:,62); 
stock_Name_Str63=data2(:,63); 
stock_Name_Str64=data2(:,64); 
stock_Name_Str65=data2(:,65); 
stock_Name_Str66=data2(:,66); 
stock_Name_Str67=data2(:,67); 
stock_Name_Str68=data2(:,68); 
stock_Name_Str69=data2(:,69); 
stock_Name_Str70=data2(:,70); 
stock_Name_Str71=data2(:,71); 
stock_Name_Str72=data2(:,72); 
stock_Name_Str73=data2(:,73); 
stock_Name_Str74=data2(:,74); 
stock_Name_Str75=data2(:,75); 
stock_Name_Str76=data2(:,76); 
stock_Name_Str77=data2(:,77); 
stock_Name_Str78=data2(:,78); 
stock_Name_Str79=data2(:,79); 
stock_Name_Str80=data2(:,80); 
stock_Name_Str81=data2(:,81); 
stock_Name_Str82=data2(:,82); 
stock_Name_Str83=data2(:,83); 
stock_Name_Str84=data2(:,84); 
stock_Name_Str85=data2(:,85); 
stock_Name_Str86=data2(:,86); 
stock_Name_Str87=data2(:,87); 
stock_Name_Str88=data2(:,88); 
stock_Name_Str89=data2(:,89); 
stock_Name_Str90=data2(:,90); 
stock_Name_Str91=data2(:,91); 
stock_Name_Str92=data2(:,92); 
stock_Name_Str93=data2(:,93); 
stock_Name_Str94=data2(:,94); 
stock_Name_Str95=data2(:,95); 
stock_Name_Str96=data2(:,96); 
stock_Name_Str97=data2(:,97); 
stock_Name_Str98=data2(:,98); 
stock_Name_Str99=data2(:,99); 
stock_Name_Str100=data2(:,100);  


stock_Name_Str101=data2(:,101);  
stock_Name_Str102=data2(:,102);  
stock_Name_Str103=data2(:,103);  
stock_Name_Str104=data2(:,104);  
stock_Name_Str105=data2(:,105);  
stock_Name_Str106=data2(:,106);  
stock_Name_Str107=data2(:,107);  
stock_Name_Str108=data2(:,108);  
stock_Name_Str109=data2(:,109);  
stock_Name_Str110=data2(:,110);  
stock_Name_Str111=data2(:,111);  
stock_Name_Str112=data2(:,112);  
stock_Name_Str113=data2(:,113);  
stock_Name_Str114=data2(:,114);  
stock_Name_Str115=data2(:,115);  
stock_Name_Str116=data2(:,116);  
stock_Name_Str117=data2(:,117);  
stock_Name_Str118=data2(:,118);  
stock_Name_Str119=data2(:,119);  
stock_Name_Str120=data2(:,120);  
stock_Name_Str121=data2(:,121);  
stock_Name_Str122=data2(:,122);  
stock_Name_Str123=data2(:,123);  
stock_Name_Str124=data2(:,124);  
stock_Name_Str125=data2(:,125);  
stock_Name_Str126=data2(:,126);  
stock_Name_Str127=data2(:,127);  
stock_Name_Str128=data2(:,128);  
stock_Name_Str129=data2(:,129);  
stock_Name_Str130=data2(:,130);  
stock_Name_Str131=data2(:,131);  
stock_Name_Str132=data2(:,132);  
stock_Name_Str133=data2(:,133);  
stock_Name_Str134=data2(:,134);  
stock_Name_Str135=data2(:,135);  
stock_Name_Str136=data2(:,136);  
stock_Name_Str137=data2(:,137);  
stock_Name_Str138=data2(:,138);  
stock_Name_Str139=data2(:,139);  
stock_Name_Str140=data2(:,140);  
stock_Name_Str141=data2(:,141);  
stock_Name_Str142=data2(:,142);  
stock_Name_Str143=data2(:,143);  
stock_Name_Str144=data2(:,144);  
stock_Name_Str145=data2(:,145);  
stock_Name_Str146=data2(:,146);  
stock_Name_Str147=data2(:,147);  
stock_Name_Str148=data2(:,148);  
stock_Name_Str149=data2(:,149);  
stock_Name_Str150=data2(:,150);  


stock_Name_Str151=data2(:,151);  
stock_Name_Str152=data2(:,152);  
stock_Name_Str153=data2(:,153);  
stock_Name_Str154=data2(:,154);  
stock_Name_Str155=data2(:,155);  
stock_Name_Str156=data2(:,156);  
stock_Name_Str157=data2(:,157);  
stock_Name_Str158=data2(:,158);  
stock_Name_Str159=data2(:,159);  
stock_Name_Str160=data2(:,160);  
stock_Name_Str161=data2(:,161);  
stock_Name_Str162=data2(:,162);  
stock_Name_Str163=data2(:,163);  
stock_Name_Str164=data2(:,164);  
stock_Name_Str165=data2(:,165);  
stock_Name_Str166=data2(:,166);  
stock_Name_Str167=data2(:,167);  
stock_Name_Str168=data2(:,168);  
stock_Name_Str169=data2(:,169);  
stock_Name_Str170=data2(:,170);  
stock_Name_Str171=data2(:,171);  
stock_Name_Str172=data2(:,172);  
stock_Name_Str173=data2(:,173);  
stock_Name_Str174=data2(:,174);  
stock_Name_Str175=data2(:,175);  
stock_Name_Str176=data2(:,176);  
stock_Name_Str177=data2(:,177);  
stock_Name_Str178=data2(:,178);  
stock_Name_Str179=data2(:,179);  
stock_Name_Str180=data2(:,180);  
stock_Name_Str181=data2(:,181);  
stock_Name_Str182=data2(:,182);  
stock_Name_Str183=data2(:,183);  
stock_Name_Str184=data2(:,184);  
stock_Name_Str185=data2(:,185);  
stock_Name_Str186=data2(:,186);  
stock_Name_Str187=data2(:,187);  
stock_Name_Str188=data2(:,188);  
stock_Name_Str189=data2(:,189);  
stock_Name_Str190=data2(:,190);  
stock_Name_Str191=data2(:,191);  
stock_Name_Str192=data2(:,192);  
stock_Name_Str193=data2(:,193);  
stock_Name_Str194=data2(:,194);  
stock_Name_Str195=data2(:,195);  
stock_Name_Str196=data2(:,196);  
stock_Name_Str197=data2(:,197);  
stock_Name_Str198=data2(:,198);  
stock_Name_Str199=data2(:,199);  
stock_Name_Str200=data2(:,200);  


stock_Name_Str201=data2(:,201);  
stock_Name_Str202=data2(:,202);  
stock_Name_Str203=data2(:,203);  
stock_Name_Str204=data2(:,204);  
stock_Name_Str205=data2(:,205);  
stock_Name_Str206=data2(:,206);  
stock_Name_Str207=data2(:,207);  
stock_Name_Str208=data2(:,208);  
stock_Name_Str209=data2(:,209);  
stock_Name_Str210=data2(:,210);  
stock_Name_Str211=data2(:,211);  
stock_Name_Str212=data2(:,212);  
stock_Name_Str213=data2(:,213);  
stock_Name_Str214=data2(:,214);  
stock_Name_Str215=data2(:,215);  
stock_Name_Str216=data2(:,216);  
stock_Name_Str217=data2(:,217);  
stock_Name_Str218=data2(:,218);  
stock_Name_Str219=data2(:,219);  
stock_Name_Str220=data2(:,220);  
stock_Name_Str221=data2(:,221);  
stock_Name_Str222=data2(:,222);  
stock_Name_Str223=data2(:,223);  
stock_Name_Str224=data2(:,224);  
stock_Name_Str225=data2(:,225);  
stock_Name_Str226=data2(:,226);  
stock_Name_Str227=data2(:,227);  
stock_Name_Str228=data2(:,228);  
stock_Name_Str229=data2(:,229);  
stock_Name_Str230=data2(:,230);  
stock_Name_Str231=data2(:,231);  
stock_Name_Str232=data2(:,232);  
stock_Name_Str233=data2(:,233);  
stock_Name_Str234=data2(:,234);  
stock_Name_Str235=data2(:,235);  
stock_Name_Str236=data2(:,236);  
stock_Name_Str237=data2(:,237);  
stock_Name_Str238=data2(:,238);  
stock_Name_Str239=data2(:,239);  
stock_Name_Str240=data2(:,240);  
stock_Name_Str241=data2(:,241);  
stock_Name_Str242=data2(:,242);  
stock_Name_Str243=data2(:,243);  
stock_Name_Str244=data2(:,244);  
stock_Name_Str245=data2(:,245);  
stock_Name_Str246=data2(:,246);  
stock_Name_Str247=data2(:,247);  
stock_Name_Str248=data2(:,248);  
stock_Name_Str249=data2(:,249);  
stock_Name_Str250=data2(:,250);  

stock_Name_Str251=data2(:,251);  
stock_Name_Str252=data2(:,252);  
stock_Name_Str253=data2(:,253);  
stock_Name_Str254=data2(:,254);  
stock_Name_Str255=data2(:,255);  
stock_Name_Str256=data2(:,256);  
stock_Name_Str257=data2(:,257);  
stock_Name_Str258=data2(:,258);  
stock_Name_Str259=data2(:,259);  
stock_Name_Str260=data2(:,260);  
stock_Name_Str261=data2(:,261);  
stock_Name_Str262=data2(:,262);  
stock_Name_Str263=data2(:,263);  
stock_Name_Str264=data2(:,264);  
stock_Name_Str265=data2(:,265);  
stock_Name_Str266=data2(:,266);  
stock_Name_Str267=data2(:,267);  
stock_Name_Str268=data2(:,268);  
stock_Name_Str269=data2(:,269);  
stock_Name_Str270=data2(:,270);  
stock_Name_Str271=data2(:,271);  
stock_Name_Str272=data2(:,272);  
stock_Name_Str273=data2(:,273);  
stock_Name_Str274=data2(:,274);  
stock_Name_Str275=data2(:,275);  
stock_Name_Str276=data2(:,276);  
stock_Name_Str277=data2(:,277);  
stock_Name_Str278=data2(:,278);  
stock_Name_Str279=data2(:,279);  
stock_Name_Str280=data2(:,280);  
stock_Name_Str281=data2(:,281);  
stock_Name_Str282=data2(:,282);  
stock_Name_Str283=data2(:,283);  
stock_Name_Str284=data2(:,284);  
stock_Name_Str285=data2(:,285);  
stock_Name_Str286=data2(:,286);  
stock_Name_Str287=data2(:,287);  
stock_Name_Str288=data2(:,288);  
stock_Name_Str289=data2(:,289);  
stock_Name_Str290=data2(:,290);  
stock_Name_Str291=data2(:,291);  
stock_Name_Str292=data2(:,292);  
stock_Name_Str293=data2(:,293);  
stock_Name_Str294=data2(:,294);  
stock_Name_Str295=data2(:,295);  
stock_Name_Str296=data2(:,296);  
stock_Name_Str297=data2(:,297);  
stock_Name_Str298=data2(:,298);  
stock_Name_Str299=data2(:,299);  
stock_Name_Str300=data2(:,300);  



stock_Name_Str301=data2(:,301);  
stock_Name_Str302=data2(:,302);  
stock_Name_Str303=data2(:,303);  
stock_Name_Str304=data2(:,304);  
stock_Name_Str305=data2(:,305);  
stock_Name_Str306=data2(:,306);  
stock_Name_Str307=data2(:,307);  
stock_Name_Str308=data2(:,308);  
stock_Name_Str309=data2(:,309);  
stock_Name_Str310=data2(:,310);  
stock_Name_Str311=data2(:,311);  
stock_Name_Str312=data2(:,312);  
stock_Name_Str313=data2(:,313);  
stock_Name_Str314=data2(:,314);  
stock_Name_Str315=data2(:,315);  
stock_Name_Str316=data2(:,316);  
stock_Name_Str317=data2(:,317);  
stock_Name_Str318=data2(:,318);  
stock_Name_Str319=data2(:,319);  
stock_Name_Str320=data2(:,320);  
stock_Name_Str321=data2(:,321);  
stock_Name_Str322=data2(:,322);  
stock_Name_Str323=data2(:,323);  
stock_Name_Str324=data2(:,324);  
stock_Name_Str325=data2(:,325);  
stock_Name_Str326=data2(:,326);  
stock_Name_Str327=data2(:,327);  
stock_Name_Str328=data2(:,328);  
stock_Name_Str329=data2(:,329);  
stock_Name_Str330=data2(:,330);  
stock_Name_Str331=data2(:,331);  
stock_Name_Str332=data2(:,332);  
stock_Name_Str333=data2(:,333);  
stock_Name_Str334=data2(:,334);  
stock_Name_Str335=data2(:,335);  
stock_Name_Str336=data2(:,336);  
stock_Name_Str337=data2(:,337);  
stock_Name_Str338=data2(:,338);  
stock_Name_Str339=data2(:,339);  
stock_Name_Str340=data2(:,340);  
stock_Name_Str341=data2(:,341);  
stock_Name_Str342=data2(:,342);  
stock_Name_Str343=data2(:,343);  
stock_Name_Str344=data2(:,344);  
stock_Name_Str345=data2(:,345);  
stock_Name_Str346=data2(:,346);  
stock_Name_Str347=data2(:,347);  
stock_Name_Str348=data2(:,348);  
stock_Name_Str349=data2(:,349);  
stock_Name_Str350=data2(:,350);  



stock_Name_Str351=data2(:,351);  
stock_Name_Str352=data2(:,352);  
stock_Name_Str353=data2(:,353);  
stock_Name_Str354=data2(:,354);  
stock_Name_Str355=data2(:,355);  
stock_Name_Str356=data2(:,356);  
stock_Name_Str357=data2(:,357);  
stock_Name_Str358=data2(:,358);  
stock_Name_Str359=data2(:,359);  
stock_Name_Str360=data2(:,360);  
stock_Name_Str361=data2(:,361);  
stock_Name_Str362=data2(:,362);  
stock_Name_Str363=data2(:,363);  
stock_Name_Str364=data2(:,364);  
stock_Name_Str365=data2(:,365);  
stock_Name_Str366=data2(:,366);  
stock_Name_Str367=data2(:,367);  
stock_Name_Str368=data2(:,368);  
stock_Name_Str369=data2(:,369);  
stock_Name_Str370=data2(:,370);  
stock_Name_Str371=data2(:,371);  
stock_Name_Str372=data2(:,372);  
stock_Name_Str373=data2(:,373);  
stock_Name_Str374=data2(:,374);  
stock_Name_Str375=data2(:,375);  
stock_Name_Str376=data2(:,376);  
stock_Name_Str377=data2(:,377);  
stock_Name_Str378=data2(:,378);  
stock_Name_Str379=data2(:,379);  
stock_Name_Str380=data2(:,380);  
stock_Name_Str381=data2(:,381);  
stock_Name_Str382=data2(:,382);  
stock_Name_Str383=data2(:,383);  
stock_Name_Str384=data2(:,384);  
stock_Name_Str385=data2(:,385);  
stock_Name_Str386=data2(:,386);  
stock_Name_Str387=data2(:,387);  
stock_Name_Str388=data2(:,388);  
stock_Name_Str389=data2(:,389);  
stock_Name_Str390=data2(:,390);  
stock_Name_Str391=data2(:,391);  
stock_Name_Str392=data2(:,392);  
stock_Name_Str393=data2(:,393);  
stock_Name_Str394=data2(:,394);  
stock_Name_Str395=data2(:,395);  
stock_Name_Str396=data2(:,396);  
stock_Name_Str397=data2(:,397);  
stock_Name_Str398=data2(:,398);  
stock_Name_Str399=data2(:,399);  
stock_Name_Str400=data2(:,400);  




stock_Name_Str401=data2(:,401);  
stock_Name_Str402=data2(:,402);  
stock_Name_Str403=data2(:,403);  
stock_Name_Str404=data2(:,404);  
stock_Name_Str405=data2(:,405);  
stock_Name_Str406=data2(:,406);  
stock_Name_Str407=data2(:,407);  
stock_Name_Str408=data2(:,408);  
stock_Name_Str409=data2(:,409);  
stock_Name_Str410=data2(:,410);  
stock_Name_Str411=data2(:,411);  
stock_Name_Str412=data2(:,412);  
stock_Name_Str413=data2(:,413);  
stock_Name_Str414=data2(:,414);  
stock_Name_Str415=data2(:,415);  
stock_Name_Str416=data2(:,416);  
stock_Name_Str417=data2(:,417);  
stock_Name_Str418=data2(:,418);  
stock_Name_Str419=data2(:,419);  
stock_Name_Str420=data2(:,420);  
stock_Name_Str421=data2(:,421);  

% syms M
% A = TXT;
% for i=1:422 
%     eval(['M' num2str(i) ' = {}'])
%     eval(['A(1,i)','=','NUM(:,i)']);
% end  


% --------------------------------------------------------------------
function duqvyichuli_Callback(hObject, eventdata, handles)
% hObject    handle to duqvyichuli (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global NUM
load data
load data2

% A = data2(1,:);
% B = data;
% for i=1:422
%     eval(['A{1,i}','=','B{:,i}']);
% end  



% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse motion over figure - except title and menu.
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% global CS;
disp('hello listbox1 created'); 
global NUM
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

load data
load data2

data_Size=size(data);
file_Length0=data_Size(1);   

% A = data2(1,:);
% B = data;
% for i=1:422
%     eval(['A(1,i)','=','B(:,i)']);
% end  

% B= data2(1,:);
% for i=1:422
%     eval(['B(1,i)','=','data(:,i)']);
%    eval(['CS={A;A[1,'num2str(i),']}']);
% end  
   
 

stock_Name_Str1=data2(:,1);  
stock_Name_Str2=data2(:,2);  
stock_Name_Str3=data2(:,3);  
stock_Name_Str4=data2(:,4);  
stock_Name_Str5=data2(:,5);  
stock_Name_Str6=data2(:,6);  
stock_Name_Str7=data2(:,7);  
stock_Name_Str8=data2(:,8);  
stock_Name_Str9=data2(:,9);  
stock_Name_Str10=data2(:,10); 
stock_Name_Str11=data2(:,11); 
stock_Name_Str12=data2(:,12); 
stock_Name_Str13=data2(:,13); 
stock_Name_Str14=data2(:,14); 
stock_Name_Str15=data2(:,15); 
stock_Name_Str16=data2(:,16); 
stock_Name_Str17=data2(:,17); 
stock_Name_Str18=data2(:,18); 
stock_Name_Str19=data2(:,19); 
stock_Name_Str20=data2(:,20); 
stock_Name_Str21=data2(:,21); 
stock_Name_Str22=data2(:,22); 
stock_Name_Str23=data2(:,23); 
stock_Name_Str24=data2(:,24); 
stock_Name_Str25=data2(:,25); 
stock_Name_Str26=data2(:,26); 
stock_Name_Str27=data2(:,27); 
stock_Name_Str28=data2(:,28); 
stock_Name_Str29=data2(:,29); 
stock_Name_Str30=data2(:,30); 
stock_Name_Str31=data2(:,31); 
stock_Name_Str32=data2(:,32); 
stock_Name_Str33=data2(:,33); 
stock_Name_Str34=data2(:,34); 
stock_Name_Str35=data2(:,35); 
stock_Name_Str36=data2(:,36); 
stock_Name_Str37=data2(:,37); 
stock_Name_Str38=data2(:,38); 
stock_Name_Str39=data2(:,39); 
stock_Name_Str40=data2(:,40); 
stock_Name_Str41=data2(:,41); 
stock_Name_Str42=data2(:,42); 
stock_Name_Str43=data2(:,43); 
stock_Name_Str44=data2(:,44); 
stock_Name_Str45=data2(:,45); 
stock_Name_Str46=data2(:,46); 
stock_Name_Str47=data2(:,47); 
stock_Name_Str48=data2(:,48); 
stock_Name_Str49=data2(:,49); 
stock_Name_Str50=data2(:,50); 

stock_Name_Str51=data2(:,51); 
stock_Name_Str52=data2(:,52); 
stock_Name_Str53=data2(:,53); 
stock_Name_Str54=data2(:,54); 
stock_Name_Str55=data2(:,55); 
stock_Name_Str56=data2(:,56); 
stock_Name_Str57=data2(:,57); 
stock_Name_Str58=data2(:,58); 
stock_Name_Str59=data2(:,59); 
stock_Name_Str60=data2(:,60); 
stock_Name_Str61=data2(:,61); 
stock_Name_Str62=data2(:,62); 
stock_Name_Str63=data2(:,63); 
stock_Name_Str64=data2(:,64); 
stock_Name_Str65=data2(:,65); 
stock_Name_Str66=data2(:,66); 
stock_Name_Str67=data2(:,67); 
stock_Name_Str68=data2(:,68); 
stock_Name_Str69=data2(:,69); 
stock_Name_Str70=data2(:,70); 
stock_Name_Str71=data2(:,71); 
stock_Name_Str72=data2(:,72); 
stock_Name_Str73=data2(:,73); 
stock_Name_Str74=data2(:,74); 
stock_Name_Str75=data2(:,75); 
stock_Name_Str76=data2(:,76); 
stock_Name_Str77=data2(:,77); 
stock_Name_Str78=data2(:,78); 
stock_Name_Str79=data2(:,79); 
stock_Name_Str80=data2(:,80); 
stock_Name_Str81=data2(:,81); 
stock_Name_Str82=data2(:,82); 
stock_Name_Str83=data2(:,83); 
stock_Name_Str84=data2(:,84); 
stock_Name_Str85=data2(:,85); 
stock_Name_Str86=data2(:,86); 
stock_Name_Str87=data2(:,87); 
stock_Name_Str88=data2(:,88); 
stock_Name_Str89=data2(:,89); 
stock_Name_Str90=data2(:,90); 
stock_Name_Str91=data2(:,91); 
stock_Name_Str92=data2(:,92); 
stock_Name_Str93=data2(:,93); 
stock_Name_Str94=data2(:,94); 
stock_Name_Str95=data2(:,95); 
stock_Name_Str96=data2(:,96); 
stock_Name_Str97=data2(:,97); 
stock_Name_Str98=data2(:,98); 
stock_Name_Str99=data2(:,99); 
stock_Name_Str100=data2(:,100);  


stock_Name_Str101=data2(:,101);  
stock_Name_Str102=data2(:,102);  
stock_Name_Str103=data2(:,103);  
stock_Name_Str104=data2(:,104);  
stock_Name_Str105=data2(:,105);  
stock_Name_Str106=data2(:,106);  
stock_Name_Str107=data2(:,107);  
stock_Name_Str108=data2(:,108);  
stock_Name_Str109=data2(:,109);  
stock_Name_Str110=data2(:,110);  
stock_Name_Str111=data2(:,111);  
stock_Name_Str112=data2(:,112);  
stock_Name_Str113=data2(:,113);  
stock_Name_Str114=data2(:,114);  
stock_Name_Str115=data2(:,115);  
stock_Name_Str116=data2(:,116);  
stock_Name_Str117=data2(:,117);  
stock_Name_Str118=data2(:,118);  
stock_Name_Str119=data2(:,119);  
stock_Name_Str120=data2(:,120);  
stock_Name_Str121=data2(:,121);  
stock_Name_Str122=data2(:,122);  
stock_Name_Str123=data2(:,123);  
stock_Name_Str124=data2(:,124);  
stock_Name_Str125=data2(:,125);  
stock_Name_Str126=data2(:,126);  
stock_Name_Str127=data2(:,127);  
stock_Name_Str128=data2(:,128);  
stock_Name_Str129=data2(:,129);  
stock_Name_Str130=data2(:,130);  
stock_Name_Str131=data2(:,131);  
stock_Name_Str132=data2(:,132);  
stock_Name_Str133=data2(:,133);  
stock_Name_Str134=data2(:,134);  
stock_Name_Str135=data2(:,135);  
stock_Name_Str136=data2(:,136);  
stock_Name_Str137=data2(:,137);  
stock_Name_Str138=data2(:,138);  
stock_Name_Str139=data2(:,139);  
stock_Name_Str140=data2(:,140);  
stock_Name_Str141=data2(:,141);  
stock_Name_Str142=data2(:,142);  
stock_Name_Str143=data2(:,143);  
stock_Name_Str144=data2(:,144);  
stock_Name_Str145=data2(:,145);  
stock_Name_Str146=data2(:,146);  
stock_Name_Str147=data2(:,147);  
stock_Name_Str148=data2(:,148);  
stock_Name_Str149=data2(:,149);  
stock_Name_Str150=data2(:,150);  


stock_Name_Str151=data2(:,151);  
stock_Name_Str152=data2(:,152);  
stock_Name_Str153=data2(:,153);  
stock_Name_Str154=data2(:,154);  
stock_Name_Str155=data2(:,155);  
stock_Name_Str156=data2(:,156);  
stock_Name_Str157=data2(:,157);  
stock_Name_Str158=data2(:,158);  
stock_Name_Str159=data2(:,159);  
stock_Name_Str160=data2(:,160);  
stock_Name_Str161=data2(:,161);  
stock_Name_Str162=data2(:,162);  
stock_Name_Str163=data2(:,163);  
stock_Name_Str164=data2(:,164);  
stock_Name_Str165=data2(:,165);  
stock_Name_Str166=data2(:,166);  
stock_Name_Str167=data2(:,167);  
stock_Name_Str168=data2(:,168);  
stock_Name_Str169=data2(:,169);  
stock_Name_Str170=data2(:,170);  
stock_Name_Str171=data2(:,171);  
stock_Name_Str172=data2(:,172);  
stock_Name_Str173=data2(:,173);  
stock_Name_Str174=data2(:,174);  
stock_Name_Str175=data2(:,175);  
stock_Name_Str176=data2(:,176);  
stock_Name_Str177=data2(:,177);  
stock_Name_Str178=data2(:,178);  
stock_Name_Str179=data2(:,179);  
stock_Name_Str180=data2(:,180);  
stock_Name_Str181=data2(:,181);  
stock_Name_Str182=data2(:,182);  
stock_Name_Str183=data2(:,183);  
stock_Name_Str184=data2(:,184);  
stock_Name_Str185=data2(:,185);  
stock_Name_Str186=data2(:,186);  
stock_Name_Str187=data2(:,187);  
stock_Name_Str188=data2(:,188);  
stock_Name_Str189=data2(:,189);  
stock_Name_Str190=data2(:,190);  
stock_Name_Str191=data2(:,191);  
stock_Name_Str192=data2(:,192);  
stock_Name_Str193=data2(:,193);  
stock_Name_Str194=data2(:,194);  
stock_Name_Str195=data2(:,195);  
stock_Name_Str196=data2(:,196);  
stock_Name_Str197=data2(:,197);  
stock_Name_Str198=data2(:,198);  
stock_Name_Str199=data2(:,199);  
stock_Name_Str200=data2(:,200);  


stock_Name_Str201=data2(:,201);  
stock_Name_Str202=data2(:,202);  
stock_Name_Str203=data2(:,203);  
stock_Name_Str204=data2(:,204);  
stock_Name_Str205=data2(:,205);  
stock_Name_Str206=data2(:,206);  
stock_Name_Str207=data2(:,207);  
stock_Name_Str208=data2(:,208);  
stock_Name_Str209=data2(:,209);  
stock_Name_Str210=data2(:,210);  
stock_Name_Str211=data2(:,211);  
stock_Name_Str212=data2(:,212);  
stock_Name_Str213=data2(:,213);  
stock_Name_Str214=data2(:,214);  
stock_Name_Str215=data2(:,215);  
stock_Name_Str216=data2(:,216);  
stock_Name_Str217=data2(:,217);  
stock_Name_Str218=data2(:,218);  
stock_Name_Str219=data2(:,219);  
stock_Name_Str220=data2(:,220);  
stock_Name_Str221=data2(:,221);  
stock_Name_Str222=data2(:,222);  
stock_Name_Str223=data2(:,223);  
stock_Name_Str224=data2(:,224);  
stock_Name_Str225=data2(:,225);  
stock_Name_Str226=data2(:,226);  
stock_Name_Str227=data2(:,227);  
stock_Name_Str228=data2(:,228);  
stock_Name_Str229=data2(:,229);  
stock_Name_Str230=data2(:,230);  
stock_Name_Str231=data2(:,231);  
stock_Name_Str232=data2(:,232);  
stock_Name_Str233=data2(:,233);  
stock_Name_Str234=data2(:,234);  
stock_Name_Str235=data2(:,235);  
stock_Name_Str236=data2(:,236);  
stock_Name_Str237=data2(:,237);  
stock_Name_Str238=data2(:,238);  
stock_Name_Str239=data2(:,239);  
stock_Name_Str240=data2(:,240);  
stock_Name_Str241=data2(:,241);  
stock_Name_Str242=data2(:,242);  
stock_Name_Str243=data2(:,243);  
stock_Name_Str244=data2(:,244);  
stock_Name_Str245=data2(:,245);  
stock_Name_Str246=data2(:,246);  
stock_Name_Str247=data2(:,247);  
stock_Name_Str248=data2(:,248);  
stock_Name_Str249=data2(:,249);  
stock_Name_Str250=data2(:,250);  

stock_Name_Str251=data2(:,251);  
stock_Name_Str252=data2(:,252);  
stock_Name_Str253=data2(:,253);  
stock_Name_Str254=data2(:,254);  
stock_Name_Str255=data2(:,255);  
stock_Name_Str256=data2(:,256);  
stock_Name_Str257=data2(:,257);  
stock_Name_Str258=data2(:,258);  
stock_Name_Str259=data2(:,259);  
stock_Name_Str260=data2(:,260);  
stock_Name_Str261=data2(:,261);  
stock_Name_Str262=data2(:,262);  
stock_Name_Str263=data2(:,263);  
stock_Name_Str264=data2(:,264);  
stock_Name_Str265=data2(:,265);  
stock_Name_Str266=data2(:,266);  
stock_Name_Str267=data2(:,267);  
stock_Name_Str268=data2(:,268);  
stock_Name_Str269=data2(:,269);  
stock_Name_Str270=data2(:,270);  
stock_Name_Str271=data2(:,271);  
stock_Name_Str272=data2(:,272);  
stock_Name_Str273=data2(:,273);  
stock_Name_Str274=data2(:,274);  
stock_Name_Str275=data2(:,275);  
stock_Name_Str276=data2(:,276);  
stock_Name_Str277=data2(:,277);  
stock_Name_Str278=data2(:,278);  
stock_Name_Str279=data2(:,279);  
stock_Name_Str280=data2(:,280);  
stock_Name_Str281=data2(:,281);  
stock_Name_Str282=data2(:,282);  
stock_Name_Str283=data2(:,283);  
stock_Name_Str284=data2(:,284);  
stock_Name_Str285=data2(:,285);  
stock_Name_Str286=data2(:,286);  
stock_Name_Str287=data2(:,287);  
stock_Name_Str288=data2(:,288);  
stock_Name_Str289=data2(:,289);  
stock_Name_Str290=data2(:,290);  
stock_Name_Str291=data2(:,291);  
stock_Name_Str292=data2(:,292);  
stock_Name_Str293=data2(:,293);  
stock_Name_Str294=data2(:,294);  
stock_Name_Str295=data2(:,295);  
stock_Name_Str296=data2(:,296);  
stock_Name_Str297=data2(:,297);  
stock_Name_Str298=data2(:,298);  
stock_Name_Str299=data2(:,299);  
stock_Name_Str300=data2(:,300);  



stock_Name_Str301=data2(:,301);  
stock_Name_Str302=data2(:,302);  
stock_Name_Str303=data2(:,303);  
stock_Name_Str304=data2(:,304);  
stock_Name_Str305=data2(:,305);  
stock_Name_Str306=data2(:,306);  
stock_Name_Str307=data2(:,307);  
stock_Name_Str308=data2(:,308);  
stock_Name_Str309=data2(:,309);  
stock_Name_Str310=data2(:,310);  
stock_Name_Str311=data2(:,311);  
stock_Name_Str312=data2(:,312);  
stock_Name_Str313=data2(:,313);  
stock_Name_Str314=data2(:,314);  
stock_Name_Str315=data2(:,315);  
stock_Name_Str316=data2(:,316);  
stock_Name_Str317=data2(:,317);  
stock_Name_Str318=data2(:,318);  
stock_Name_Str319=data2(:,319);  
stock_Name_Str320=data2(:,320);  
stock_Name_Str321=data2(:,321);  
stock_Name_Str322=data2(:,322);  
stock_Name_Str323=data2(:,323);  
stock_Name_Str324=data2(:,324);  
stock_Name_Str325=data2(:,325);  
stock_Name_Str326=data2(:,326);  
stock_Name_Str327=data2(:,327);  
stock_Name_Str328=data2(:,328);  
stock_Name_Str329=data2(:,329);  
stock_Name_Str330=data2(:,330);  
stock_Name_Str331=data2(:,331);  
stock_Name_Str332=data2(:,332);  
stock_Name_Str333=data2(:,333);  
stock_Name_Str334=data2(:,334);  
stock_Name_Str335=data2(:,335);  
stock_Name_Str336=data2(:,336);  
stock_Name_Str337=data2(:,337);  
stock_Name_Str338=data2(:,338);  
stock_Name_Str339=data2(:,339);  
stock_Name_Str340=data2(:,340);  
stock_Name_Str341=data2(:,341);  
stock_Name_Str342=data2(:,342);  
stock_Name_Str343=data2(:,343);  
stock_Name_Str344=data2(:,344);  
stock_Name_Str345=data2(:,345);  
stock_Name_Str346=data2(:,346);  
stock_Name_Str347=data2(:,347);  
stock_Name_Str348=data2(:,348);  
stock_Name_Str349=data2(:,349);  
stock_Name_Str350=data2(:,350);  



stock_Name_Str351=data2(:,351);  
stock_Name_Str352=data2(:,352);  
stock_Name_Str353=data2(:,353);  
stock_Name_Str354=data2(:,354);  
stock_Name_Str355=data2(:,355);  
stock_Name_Str356=data2(:,356);  
stock_Name_Str357=data2(:,357);  
stock_Name_Str358=data2(:,358);  
stock_Name_Str359=data2(:,359);  
stock_Name_Str360=data2(:,360);  
stock_Name_Str361=data2(:,361);  
stock_Name_Str362=data2(:,362);  
stock_Name_Str363=data2(:,363);  
stock_Name_Str364=data2(:,364);  
stock_Name_Str365=data2(:,365);  
stock_Name_Str366=data2(:,366);  
stock_Name_Str367=data2(:,367);  
stock_Name_Str368=data2(:,368);  
stock_Name_Str369=data2(:,369);  
stock_Name_Str370=data2(:,370);  
stock_Name_Str371=data2(:,371);  
stock_Name_Str372=data2(:,372);  
stock_Name_Str373=data2(:,373);  
stock_Name_Str374=data2(:,374);  
stock_Name_Str375=data2(:,375);  
stock_Name_Str376=data2(:,376);  
stock_Name_Str377=data2(:,377);  
stock_Name_Str378=data2(:,378);  
stock_Name_Str379=data2(:,379);  
stock_Name_Str380=data2(:,380);  
stock_Name_Str381=data2(:,381);  
stock_Name_Str382=data2(:,382);  
stock_Name_Str383=data2(:,383);  
stock_Name_Str384=data2(:,384);  
stock_Name_Str385=data2(:,385);  
stock_Name_Str386=data2(:,386);  
stock_Name_Str387=data2(:,387);  
stock_Name_Str388=data2(:,388);  
stock_Name_Str389=data2(:,389);  
stock_Name_Str390=data2(:,390);  
stock_Name_Str391=data2(:,391);  
stock_Name_Str392=data2(:,392);  
stock_Name_Str393=data2(:,393);  
stock_Name_Str394=data2(:,394);  
stock_Name_Str395=data2(:,395);  
stock_Name_Str396=data2(:,396);  
stock_Name_Str397=data2(:,397);  
stock_Name_Str398=data2(:,398);  
stock_Name_Str399=data2(:,399);  
stock_Name_Str400=data2(:,400);  




stock_Name_Str401=data2(:,401);  
stock_Name_Str402=data2(:,402);  
stock_Name_Str403=data2(:,403);  
stock_Name_Str404=data2(:,404);  
stock_Name_Str405=data2(:,405);  
stock_Name_Str406=data2(:,406);  
stock_Name_Str407=data2(:,407);  
stock_Name_Str408=data2(:,408);  
stock_Name_Str409=data2(:,409);  
stock_Name_Str410=data2(:,410);  
stock_Name_Str411=data2(:,411);  
stock_Name_Str412=data2(:,412);  
stock_Name_Str413=data2(:,413);  
stock_Name_Str414=data2(:,414);  
stock_Name_Str415=data2(:,415);  
stock_Name_Str416=data2(:,416);  
stock_Name_Str417=data2(:,417);  
stock_Name_Str418=data2(:,418);  
stock_Name_Str419=data2(:,419);  
stock_Name_Str420=data2(:,420);  
stock_Name_Str421=data2(:,421);  
stock_Name_Str1(1:10)
% data2(1:11,421)
% stock_Name_Str421
% stock_Name_Str421(1:10)
% 
% size(stock_Name_Str400)
% size(stock_Name_Str401)
% size(stock_Name_Str402)
% size(stock_Name_Str403)
% size(stock_Name_Str404)
% size(stock_Name_Str405)
% size(stock_Name_Str406)
% size(stock_Name_Str407)
% size(stock_Name_Str408)
% size(stock_Name_Str409)
% size(stock_Name_Str410)
% size(stock_Name_Str411)
% size(stock_Name_Str412)
% size(stock_Name_Str413)
% size(stock_Name_Str414)
% size(stock_Name_Str415)
% size(stock_Name_Str416)
% size(stock_Name_Str417)
% size(stock_Name_Str418)
% size(stock_Name_Str419)
% size(stock_Name_Str420)
% size(stock_Name_Str421)

CS={stock_Name_Str1,stock_Name_Str2,stock_Name_Str3,stock_Name_Str4,stock_Name_Str5,stock_Name_Str6,stock_Name_Str7,stock_Name_Str8,stock_Name_Str9,stock_Name_Str10,...
    stock_Name_Str11,stock_Name_Str12,stock_Name_Str13,stock_Name_Str14,stock_Name_Str15,stock_Name_Str16,stock_Name_Str17,stock_Name_Str18,stock_Name_Str19,stock_Name_Str20,...
    stock_Name_Str21,stock_Name_Str22,stock_Name_Str23,stock_Name_Str24,stock_Name_Str25,stock_Name_Str26,stock_Name_Str27,stock_Name_Str28,stock_Name_Str29,stock_Name_Str30,...
    stock_Name_Str31,stock_Name_Str32,stock_Name_Str33,stock_Name_Str34,stock_Name_Str35,stock_Name_Str36,stock_Name_Str37,stock_Name_Str38,stock_Name_Str39,stock_Name_Str40,...
    stock_Name_Str41,stock_Name_Str42,stock_Name_Str43,stock_Name_Str44,stock_Name_Str45,stock_Name_Str46,stock_Name_Str47,stock_Name_Str48,stock_Name_Str49,stock_Name_Str50,...
    stock_Name_Str51,stock_Name_Str52,stock_Name_Str53,stock_Name_Str54,stock_Name_Str55,stock_Name_Str56,stock_Name_Str57,stock_Name_Str58,stock_Name_Str59,stock_Name_Str60,...
    stock_Name_Str61,stock_Name_Str62,stock_Name_Str63,stock_Name_Str64,stock_Name_Str65,stock_Name_Str66,stock_Name_Str67,stock_Name_Str68,stock_Name_Str69,stock_Name_Str70,...
    stock_Name_Str71,stock_Name_Str72,stock_Name_Str73,stock_Name_Str74,stock_Name_Str75,stock_Name_Str76,stock_Name_Str77,stock_Name_Str78,stock_Name_Str79,stock_Name_Str80,...
    stock_Name_Str81,stock_Name_Str82,stock_Name_Str83,stock_Name_Str84,stock_Name_Str85,stock_Name_Str86,stock_Name_Str87,stock_Name_Str88,stock_Name_Str89,stock_Name_Str90,...
    stock_Name_Str91,stock_Name_Str92,stock_Name_Str93,stock_Name_Str94,stock_Name_Str95,stock_Name_Str96,stock_Name_Str97,stock_Name_Str98,stock_Name_Str99,stock_Name_Str100,...
    
    stock_Name_Str101,stock_Name_Str102,stock_Name_Str103,stock_Name_Str104,stock_Name_Str105,stock_Name_Str106,stock_Name_Str107,stock_Name_Str108,stock_Name_Str109,stock_Name_Str110,...
    stock_Name_Str111,stock_Name_Str112,stock_Name_Str113,stock_Name_Str114,stock_Name_Str115,stock_Name_Str116,stock_Name_Str117,stock_Name_Str118,stock_Name_Str119,stock_Name_Str120,...
    stock_Name_Str121,stock_Name_Str122,stock_Name_Str123,stock_Name_Str124,stock_Name_Str125,stock_Name_Str126,stock_Name_Str127,stock_Name_Str128,stock_Name_Str129,stock_Name_Str130,...
    stock_Name_Str131,stock_Name_Str132,stock_Name_Str133,stock_Name_Str134,stock_Name_Str135,stock_Name_Str136,stock_Name_Str137,stock_Name_Str138,stock_Name_Str139,stock_Name_Str140,...
    stock_Name_Str141,stock_Name_Str142,stock_Name_Str143,stock_Name_Str144,stock_Name_Str145,stock_Name_Str146,stock_Name_Str147,stock_Name_Str148,stock_Name_Str149,stock_Name_Str150,...
    stock_Name_Str151,stock_Name_Str152,stock_Name_Str153,stock_Name_Str154,stock_Name_Str155,stock_Name_Str156,stock_Name_Str157,stock_Name_Str158,stock_Name_Str159,stock_Name_Str160,...
    stock_Name_Str161,stock_Name_Str162,stock_Name_Str163,stock_Name_Str164,stock_Name_Str165,stock_Name_Str166,stock_Name_Str167,stock_Name_Str168,stock_Name_Str169,stock_Name_Str170,...
    stock_Name_Str171,stock_Name_Str172,stock_Name_Str173,stock_Name_Str174,stock_Name_Str175,stock_Name_Str176,stock_Name_Str177,stock_Name_Str178,stock_Name_Str179,stock_Name_Str180,...
    stock_Name_Str181,stock_Name_Str182,stock_Name_Str183,stock_Name_Str184,stock_Name_Str185,stock_Name_Str186,stock_Name_Str187,stock_Name_Str188,stock_Name_Str189,stock_Name_Str190,...
    stock_Name_Str191,stock_Name_Str192,stock_Name_Str193,stock_Name_Str194,stock_Name_Str195,stock_Name_Str196,stock_Name_Str197,stock_Name_Str198,stock_Name_Str199,stock_Name_Str200,...
    
    stock_Name_Str201,stock_Name_Str202,stock_Name_Str203,stock_Name_Str204,stock_Name_Str205,stock_Name_Str206,stock_Name_Str207,stock_Name_Str208,stock_Name_Str209,stock_Name_Str210,...
    stock_Name_Str211,stock_Name_Str212,stock_Name_Str213,stock_Name_Str214,stock_Name_Str215,stock_Name_Str216,stock_Name_Str217,stock_Name_Str218,stock_Name_Str219,stock_Name_Str220,...
    stock_Name_Str221,stock_Name_Str222,stock_Name_Str223,stock_Name_Str224,stock_Name_Str225,stock_Name_Str226,stock_Name_Str227,stock_Name_Str228,stock_Name_Str229,stock_Name_Str230,...
    stock_Name_Str231,stock_Name_Str232,stock_Name_Str233,stock_Name_Str234,stock_Name_Str235,stock_Name_Str236,stock_Name_Str237,stock_Name_Str238,stock_Name_Str239,stock_Name_Str240,...
    stock_Name_Str241,stock_Name_Str242,stock_Name_Str243,stock_Name_Str244,stock_Name_Str245,stock_Name_Str246,stock_Name_Str247,stock_Name_Str248,stock_Name_Str249,stock_Name_Str250,...
    stock_Name_Str251,stock_Name_Str252,stock_Name_Str253,stock_Name_Str254,stock_Name_Str255,stock_Name_Str256,stock_Name_Str257,stock_Name_Str258,stock_Name_Str259,stock_Name_Str260,...
    stock_Name_Str261,stock_Name_Str262,stock_Name_Str263,stock_Name_Str264,stock_Name_Str265,stock_Name_Str266,stock_Name_Str267,stock_Name_Str268,stock_Name_Str269,stock_Name_Str270,...
    stock_Name_Str271,stock_Name_Str272,stock_Name_Str273,stock_Name_Str274,stock_Name_Str275,stock_Name_Str276,stock_Name_Str277,stock_Name_Str278,stock_Name_Str279,stock_Name_Str280,...
    stock_Name_Str281,stock_Name_Str282,stock_Name_Str283,stock_Name_Str284,stock_Name_Str285,stock_Name_Str286,stock_Name_Str287,stock_Name_Str288,stock_Name_Str289,stock_Name_Str290,...
    stock_Name_Str291,stock_Name_Str292,stock_Name_Str293,stock_Name_Str294,stock_Name_Str295,stock_Name_Str296,stock_Name_Str297,stock_Name_Str298,stock_Name_Str299,stock_Name_Str300,...
    
    stock_Name_Str301,stock_Name_Str302,stock_Name_Str303,stock_Name_Str304,stock_Name_Str305,stock_Name_Str306,stock_Name_Str307,stock_Name_Str308,stock_Name_Str309,stock_Name_Str310,...
    stock_Name_Str311,stock_Name_Str312,stock_Name_Str313,stock_Name_Str314,stock_Name_Str315,stock_Name_Str316,stock_Name_Str317,stock_Name_Str318,stock_Name_Str319,stock_Name_Str320,...
    stock_Name_Str321,stock_Name_Str322,stock_Name_Str323,stock_Name_Str324,stock_Name_Str325,stock_Name_Str326,stock_Name_Str327,stock_Name_Str328,stock_Name_Str329,stock_Name_Str330,...
    stock_Name_Str331,stock_Name_Str332,stock_Name_Str333,stock_Name_Str334,stock_Name_Str335,stock_Name_Str336,stock_Name_Str337,stock_Name_Str338,stock_Name_Str339,stock_Name_Str340,...
    stock_Name_Str341,stock_Name_Str342,stock_Name_Str343,stock_Name_Str344,stock_Name_Str345,stock_Name_Str346,stock_Name_Str347,stock_Name_Str348,stock_Name_Str349,stock_Name_Str350,...
    stock_Name_Str351,stock_Name_Str352,stock_Name_Str353,stock_Name_Str354,stock_Name_Str355,stock_Name_Str356,stock_Name_Str357,stock_Name_Str358,stock_Name_Str359,stock_Name_Str360,...
    stock_Name_Str361,stock_Name_Str362,stock_Name_Str363,stock_Name_Str364,stock_Name_Str365,stock_Name_Str366,stock_Name_Str367,stock_Name_Str368,stock_Name_Str369,stock_Name_Str370,...
    stock_Name_Str371,stock_Name_Str372,stock_Name_Str373,stock_Name_Str374,stock_Name_Str375,stock_Name_Str376,stock_Name_Str377,stock_Name_Str378,stock_Name_Str379,stock_Name_Str380,...
    stock_Name_Str381,stock_Name_Str382,stock_Name_Str383,stock_Name_Str384,stock_Name_Str385,stock_Name_Str386,stock_Name_Str387,stock_Name_Str388,stock_Name_Str389,stock_Name_Str390,...
    stock_Name_Str391,stock_Name_Str392,stock_Name_Str393,stock_Name_Str394,stock_Name_Str395,stock_Name_Str396,stock_Name_Str397,stock_Name_Str398,stock_Name_Str399,stock_Name_Str400,...
 
    stock_Name_Str401,stock_Name_Str402,stock_Name_Str403,stock_Name_Str404,stock_Name_Str405,stock_Name_Str406,stock_Name_Str407,stock_Name_Str408,stock_Name_Str409,stock_Name_Str410,...
    stock_Name_Str411,stock_Name_Str412,stock_Name_Str413,stock_Name_Str414,stock_Name_Str415,stock_Name_Str416,stock_Name_Str417,stock_Name_Str418,stock_Name_Str419,stock_Name_Str420,...
    stock_Name_Str421};

% for i=1:421
%     handles.CS(i)=CS(i);
% end
handles.CS=CS;
guidata(hObject,handles)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% global CS;
% 
% CS(1:421)

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selected_index=get(handles.listbox1,'value');
str=get(handles.listbox1,'string');
set(handles.edit1,'string',str{selected_index});
% if(selected_index>0)
%     selected_index
%     x=CS(selected_index);
% end
x=handles.CS{selected_index};
handles.x=x;
guidata(hObject,handles)



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% global CS;
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selected_index=get(handles.listbox1,'value');
str=get(handles.listbox1,'string');
set(handles.edit2,'string',str{selected_index});
y=handles.CS{selected_index};
% y=CS(selected_index);
handles.y=y;
guidata(hObject,handles)


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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1)
plot(handles.x,handles.y)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
