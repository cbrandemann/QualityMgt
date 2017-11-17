page 50101 "N154 Incident Entry List"
{
    PageType = List;
    SourceTable = "N154 Incident Entry";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No.";"Entry No.")
                {
                    ApplicationArea=All;    
                }
                field("Incident Area";"Incident Area")
                {
                    ApplicationArea=All;    
                }
                field("Source Record ID";"Source Record ID")
                {
                    ApplicationArea=All;    
                }
            }
        }
        area(factboxes)
        {
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }
}