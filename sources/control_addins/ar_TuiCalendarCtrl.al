controladdin ar_TuiCalendarCtrl
{
    Scripts =
        'scripts/startup.js'
        , 'scripts/supplyData.js'
        , 'scripts/tui-time-picker.min.js'
        , 'scripts/tui-date-picker.min.js'
        , 'scripts/toastui-calendar.min.js'
        , 'https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js';

    StyleSheets =
        'stylesheets/tui-time-picker.min.css'
        , 'stylesheets/tui-date-picker.min.css'
        , 'stylesheets/toastui-calendar.min.css'
        , 'https://cdn.jsdelivr.net/npm/bulma@1.0.2/css/bulma.min.css'
        , 'https://fonts.googleapis.com/icon?family=Material+Icons'
        , 'https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined';

    StartupScript = 'scripts/startup.js';
    Images = 'htmls/calendarContainer.html';

    RequestedHeight = 650;
    MinimumHeight = 650;
    MinimumWidth = 600;
    MaximumWidth = 1000;
    MaximumHeight = 1000;
    HorizontalStretch = true;
    VerticalStretch = true;

    event OnInsertNewRecord();
    event OnControlAddInReady();
    event ShowMessageOnBC(msg: Text);

    procedure RetrieveData(EventRec: Text);
}