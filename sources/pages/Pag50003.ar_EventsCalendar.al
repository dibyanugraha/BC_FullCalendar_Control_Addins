page 50003 ar_EventsCalendar
{
    Caption = 'Events Calendar';
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            part(EventsCalendar; ar_EventsCalFactbox)
            {
                Caption = 'Calendar';
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    begin
        //eventsTable.FindSet();
    end;

    trigger OnAfterGetRecord()
    var
        jsonEvent: JsonObject;
        jsonText: Text;
    begin
        repeat
            Clear(jsonEvent);
            jsonEvent.Add(eventsTable.FieldCaption("No."), eventsTable."No.");
            jsonEvent.Add(eventsTable.FieldCaption(Title), eventsTable.Title);
            jsonEvent.Add(eventsTable.FieldCaption(Description), eventsTable.Description);
            jsonEvent.Add(eventsTable.FieldCaption(Color), eventsTable.Color);
            jsonEvent.Add(eventsTable.FieldCaption("Start Date"), eventsTable."Start Date");
            jsonEvent.Add(eventsTable.FieldCaption("End Date"), eventsTable."End Date");
            jsonEvent.WriteTo(jsonText);

            CurrPage.EventsCalendar.Page.SendToJs(jsonText);
        until eventsTable.Next() = 0;
    end;

    var
        eventsTable: Record ar_Event;
}