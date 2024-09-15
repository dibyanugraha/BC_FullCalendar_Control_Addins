controladdin ar_FullCalendarCtrl
{
    Scripts =
        'scripts/startup.js'
        , 'scripts/supplyData.js'
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
    event ShowMessageOnBC(msg: Text);
    event ShowConfirmDialogOnBC(msg: Text);

    procedure AcceptConfirm(answer: Boolean);
    procedure RetrieveData(EventRec: Text);
}