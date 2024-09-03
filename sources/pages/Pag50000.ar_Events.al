page 50000 ar_EventsList
{
    Caption = 'Events List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ar_Event;
    Editable = true;
    DelayedInsert = true;

    layout
    {
        area(Content)
        {
            repeater(MainColumns)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Color; Rec.Color)
                {
                    ApplicationArea = All;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(FactBoxes)
        {
            part(EventsCalendar; ar_EventsCalFactbox)
            {
                Caption = 'Calendar';
                ApplicationArea = All;
            }
        }
    }

    trigger OnInsertRecord(BelowXRec: Boolean): Boolean
    var
        jsonEvent: JsonObject;
        jsonText: Text;
    begin
        Clear(jsonEvent);
        jsonEvent.Add('Event No.', Rec."No.");
        jsonEvent.Add(Rec.FieldCaption(Title), Rec.Title);
        jsonEvent.Add(Rec.FieldCaption(Description), Rec.Description);
        jsonEvent.Add(Rec.FieldCaption(Color), Rec.Color);
        jsonEvent.Add(Rec.FieldCaption("Start Date"), Rec."Start Date");
        jsonEvent.Add(Rec.FieldCaption("End Date"), Rec."End Date");
        jsonEvent.WriteTo(jsonText);

        CurrPage.EventsCalendar.Page.SendToJs(jsonText);

        //  we don't need to re-insert from page
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    var
        jsonEvent: JsonObject;
        jsonText: Text;
    begin
        Clear(jsonEvent);
        jsonEvent.Add(Rec.FieldCaption("No."), Rec."No.");
        jsonEvent.Add(Rec.FieldCaption(Title), Rec.Title);
        jsonEvent.Add(Rec.FieldCaption(Description), Rec.Description);
        jsonEvent.Add(Rec.FieldCaption(Color), Rec.Color);
        jsonEvent.Add(Rec.FieldCaption("Start Date"), Rec."Start Date");
        jsonEvent.Add(Rec.FieldCaption("End Date"), Rec."End Date");
        jsonEvent.WriteTo(jsonText);

        CurrPage.EventsCalendar.Page.SendToJs(jsonText);

        //  we don't need to re-insert from page
        exit(false);
    end;
}