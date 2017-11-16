table 50101 "N154 Incident Entry"
{

    fields
    {

        field(4;"Entry No.";Integer)
        {
        AutoIncrement=true;
        CaptionML=ENU='Entry No.';
        }
        
    }

    keys
    {
        key(PK;"Entry No.")
        {
            Clustered = true;
        }
    }
    
    var
        myInt : Integer;

    trigger OnInsert();
    begin
    end;

    trigger OnModify();
    begin
    end;

    trigger OnDelete();
    begin
    end;

    trigger OnRename();
    begin
    end;

}