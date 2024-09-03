page 50004 ar_EventsWorksheet
{
    Caption = 'Events Worksheet';
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            part(ar_EventsCalPart; ar_EventsCalPart)
            {
                Caption = 'Events';
                ApplicationArea = All;
            }
            part(EventsCalendar; ar_EventsCalFactbox)
            {
                Caption = 'Calendar';
                ApplicationArea = All;
            }
        }
    }
}