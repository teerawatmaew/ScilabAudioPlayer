// This GUI file is generated by guibuilder version 4.2.1
//////////
f=figure('figure_position',[400,50],'figure_size',[640,480],'auto_resize','on','background',[33],'figure_name','Graphic window number %d','dockable','off','infobar_visible','off','toolbar_visible','off','menubar_visible','off','default_axes','on','visible','off');
//////////
handles.dummy = 0;
handles.pbUpload=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.7035256,0.7722727,0.2580128,0.1],'Relief','default','SliderStep',[0.01,0.1],'String','Upload Audio','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','pbUpload','Callback','pbUpload_callback(handles)')
handles.pbPlay=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.7035256,0.5668182,0.2580128,0.1022727],'Relief','default','SliderStep',[0.01,0.1],'String','Play','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','pbPlay','Callback','pbPlay_callback(handles)')
handles.warnning=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[11],'FontUnits','points','FontWeight','bold','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','left','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.7335256,0.6895455,0.1980128,0.06],'Relief','default','SliderStep',[0.01,0.1],'String',' Cannot load a HD file','Style','text','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','warnning','Callback','')
handles.pbVolumn=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.7035256,0.4210606,0.2580128,0.1022727],'Relief','default','SliderStep',[0.01,0.1],'String','Volumn','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','pbVolumn','Callback','pbVolumn_callback(handles)')
handles.pbTreshold=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','left','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.7035256,0.275303,0.2580128,0.1022727],'Relief','default','SliderStep',[0.01,0.1],'String','Threshold','Style','slider','Value',[1],'VerticalAlignment','middle','Visible','on','Tag','pbTreshold','Callback','pbTreshold_callback(handles)')
handles.Axes1= newaxes();handles.Axes1.margins = [ 0 0 0 0];handles.Axes1.axes_bounds = [0.0428846,0.0627273,0.6266026,0.4231818];handles.Axes1.auto_clear = 'on';
handles.Axes2= newaxes();handles.Axes2.margins = [ 0 0 0 0];handles.Axes2.axes_bounds = [0.0453125,0.5659883,0.6221875,0.3694325];handles.Axes2.auto_clear = 'on';
handles.pbChipmunk=uicontrol(f,'unit','normalized','BackgroundColor',[-1,-1,-1],'Enable','on','FontAngle','normal','FontName','Tahoma','FontSize',[12],'FontUnits','points','FontWeight','normal','ForegroundColor',[-1,-1,-1],'HorizontalAlignment','center','ListboxTop',[],'Max',[1],'Min',[0],'Position',[0.7035256,0.1295455,0.2580128,0.1022727],'Relief','default','SliderStep',[0.01,0.1],'String','Chipmunk','Style','pushbutton','Value',[0],'VerticalAlignment','middle','Visible','on','Tag','pbChipmunk','Callback','pbChipmunk_callback(handles)')

f.visible = "on";

//////////
// Callbacks are defined as below. Please do not delete the comments as it will be used in coming version
//////////

function pbUpload_callback(handles)
// Choose Wav file to import
fn = uigetfile(["*.wav"]);
y=0;
[y,Fs,bits]=wavread(fn);
data = y';
// Plot the Signal
sca(handles.Axes1);
plot(data);

sca(handles.Axes2);
F = fft(data);
plot(abs(F));
//analyze(data);

// Saving Data
handles.data = data;
handles.original = data;
handles = resume(handles);
endfunction


function pbPlay_callback(handles)
playsnd(handles.data,8000);
endfunction


function pbVolumn_callback(handles)
val = handles.pbTreshold.value;
data2 = handles.original*val;

//plot a signals
sca(handles.Axes1);
plot(data2);
sca(handles.Axes2);
F = fft(handles.data);
plot(abs(F));
//analyse(handles.data)

// Saving Data
handles.data = data2;
handles = resume(handles);

endfunction


function pbTreshold_callback(handles)
pbVolumn_callback(handles);
endfunction


function pbChipmunk_callback(handles)
playsnd(handles.data,10000);
endfunction
