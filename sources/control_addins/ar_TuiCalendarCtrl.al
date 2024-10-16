controladdin ar_TuiCalendarCtrl
{
    Scripts =
        'scripts/startup.js'
        , 'scripts/supplyData.js'
        , 'scripts/toastui-calendar.min.js';

    StyleSheets =
        'stylesheets/toastui-calendar.min.css';

    StartupScript = 'scripts/startup.js';

    RequestedHeight = 500;
    RequestedWidth = 600;
    MinimumWidth = 400;
    MaximumWidth = 2000;
    MinimumHeight = 400;
    MaximumHeight = 2000;
    HorizontalStretch = true;
    VerticalStretch = true;
    HorizontalShrink = true;
    VerticalShrink = true;

    event OnInsertNewRecord();
    event OnControlAddInReady();
    event ShowMessageOnBC(msg: Text);

    procedure RetrieveData(EventRec: Text);
}