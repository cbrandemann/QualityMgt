table 50101 "N154 Incident Entry"
{

    fields
    {

        field(1;"Entry No.";Integer)
        {
        AutoIncrement=true;
        }
        field(2;"Source Record ID";RecordId)
        {
        }
        field(3;"Incident Area";Text[20])
        {
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