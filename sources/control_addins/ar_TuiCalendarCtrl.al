controladdin ar_TuiCalendarCtrl
{
    Scripts =
        'scripts/startup.js'
        , 'scripts/supplyData.js'
        , 'scripts/toastui-calendar.min.js'
        , 'https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js';

    StyleSheets =
        'stylesheets/toastui-calendar.min.css'
        , 'https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css'
        , 'https://fonts.googleapis.com/icon?family=Material+Icons'
        , 'https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined';

    StartupScript = 'scripts/startup.js';
    Images = 'htmls/calendarContainer.html';

    RequestedHeight = 700;
    RequestedWidth = 700;
    MinimumWidth = 600;
    MaximumWidth = 2000;
    MinimumHeight = 600;
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