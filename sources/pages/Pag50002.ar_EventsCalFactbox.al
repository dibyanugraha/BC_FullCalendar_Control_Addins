page 50002 ar_EventsCalFactbox
{
    ApplicationArea = All;
    PageType = CardPart;

    layout
    {
        area(Content)
        {
            usercontrol(EventsCalendar; ar_FullCalendarCtrl)
            {
                ApplicationArea = All;

                trigger OnControlAddInReady()
                begin
                    Message('Events Calendar is ready!');
                end;

                trigger ShowMessageOnBC(msg: Text)
                begin
                    Message(msg);
                end;

                trigger ShowConfirmDialogOnBC(msg: Text)
                begin
                    if Confirm(msg) then
                        CurrPage.EventsCalendar.AcceptConfirm(true)
                    else
                        CurrPage.EventsCalendar.AcceptConfirm(false);
                end;
            }
        }
    }

    procedure SendToJs(eventData: Text)
    begin
        CurrPage.EventsCalendar.RetrieveData(eventData);
    end;
}