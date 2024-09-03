controladdin ar_FullCalendarCtrl
{
    Scripts =
        'scripts/startup.js'
        , 'scripts/index.global.min.js';

    StyleSheets =
        'stylesheets/fullcalendar_default_style.css';

    StartupScript = 'scripts/startup.js';

    RequestedHeight = 500;
    RequestedWidth = 600;
    MinimumWidth = 400;
    MaximumWidth = 1000;
    MinimumHeight = 300;
    MaximumHeight = 2000;
    HorizontalStretch = true;
    VerticalStretch = true;

    event OnInsertNewRecord();
    event OnControlAddInReady();
    procedure RetrieveData(EventRec: Text);
}