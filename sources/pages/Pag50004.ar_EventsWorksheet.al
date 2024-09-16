page 50004 ar_EventsWorksheet
{
    Caption = 'Events Worksheet';
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Tasks;
    SourceTable = "Marketing Setup";

    layout
    {
        area(Content)
        {
            group(TotalEvents)
            {
                Caption = 'Total';
                field(ar_TotalEvents; Rec.ar_TotalEvents)
                {
                    ApplicationArea = All;
                }
            }
            part(EventsCalPart; ar_EventsCalPart)
            {
                Caption = 'Events';
                ApplicationArea = All;
                UpdatePropagation = Both;
                SubPageLink = "Marketing Setup" = field("Primary Key");
            }
            part(EventsCalendar; ar_EventsCalFactbox)
            {
                Caption = 'Calendar';
                ApplicationArea = All;
            }
        }
    }

    trigger OnOpenPage()
    begin
        eventsTable.FindSet();
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