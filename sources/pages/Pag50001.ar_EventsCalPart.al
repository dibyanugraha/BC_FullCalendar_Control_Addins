page 50001 ar_EventsCalPart
{
    Caption = 'Events';
    PageType = ListPart;
    ApplicationArea = All;
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
    }

    trigger OnModifyRecord(): Boolean
    begin
        CurrPage.Update(false);
    end;

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.Update(false);
    end;

    trigger OnInsertRecord(BelowXRec: Boolean): Boolean
    begin
        CurrPage.Update(false);
    end;
}