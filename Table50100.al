table 50100 "N154 Setup"
{

    fields
    {
        field(1;"Primary Key";code[10])
        {
            
        }
        field(2;"Automatic create measurements";Boolean)
        {
            CaptionML=ENU='Code';
        }
        
    }

    keys
    {
        key(PK;"Primary Key")
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