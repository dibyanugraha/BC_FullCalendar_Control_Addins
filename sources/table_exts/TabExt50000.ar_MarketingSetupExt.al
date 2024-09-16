tableextension 50000 ar_MarketingSetupExt extends "Marketing Setup"
{
    fields
    {
        field(50000; ar_EventNos; Code[20])
        {
            Caption = 'Event Nos.';
            TableRelation = "No. Series";
        }
        field(50001; ar_TotalEvents; Integer)
        {
            Caption = 'Total Events';
            FieldClass = FlowField;
            CalcFormula = count(ar_Event);
            Editable = false;
        }
    }
}