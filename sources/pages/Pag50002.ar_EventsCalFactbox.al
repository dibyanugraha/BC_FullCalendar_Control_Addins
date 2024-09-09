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

                trigger ShowMessageOnBC(type: Text; msg: Text)
                begin
                    case type of
                        'info':
                            Message(msg);
                        'confirm':
                            if Confirm(msg) then
                                CurrPage.EventsCalendar.AcceptConfirm(true)
                            else
                                CurrPage.EventsCalendar.AcceptConfirm(false);
                        else
                            ;
                    end;
                end;
            }
        }
    }

    procedure SendToJs(eventData: Text)
    begin
        CurrPage.EventsCalendar.RetrieveData(eventData);
    end;
}