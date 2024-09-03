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
            }
        }
    }

    procedure SendToJs(eventData: Text)
    begin
        CurrPage.EventsCalendar.RetrieveData(eventData);
    end;
}