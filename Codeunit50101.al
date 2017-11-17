codeunit 50101 "N154 Incident Mgt."
{
    trigger OnRun();
    begin
    end;
    
    var


    procedure CreateIncidentEnry(Source:Variant);
    var
        IncidentEntry : Record "N154 Incident Entry";
        RecRef : RecordRef;
        EventHandled:Boolean;
    begin
        OnBeforeCreateIncidentEntry(IncidentEntry);
        with IncidentEntry do begin 
            RecRef.GetTable(Source);
            "Source Record ID" := RecRef.RecordId;
            OnAfterFillSourceDetails(IncidentEntry,EventHandled);
            Insert;
        end;
        OnAfterCreateIncidentEntry(IncidentEntry);
    end;

    [IntegrationEvent(false,false)]
    local procedure OnBeforeCreateIncidentEntry(var IncidentEntry:record "N154 Incident Entry");
    begin
    end;

    [IntegrationEvent(false,false)]
    local procedure OnAfterCreateIncidentEntry(var IncidentEntry:record "N154 Incident Entry");
    begin
    end;    

    [IntegrationEvent(false,false)]
    local procedure OnAfterFillSourceDetails(var IncidentEntry:record "N154 Incident Entry";var EventHandled:boolean);
    begin    
    end;        
}