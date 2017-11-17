codeunit 50100 "N154 Purch Receipt Integration"
{
    trigger OnRun();
    begin
    end;
    
    var
        myInt : Integer;


    [EventSubscriber(ObjectType::Codeunit, 90, 'OnAfterPostPurchaseDoc','', true, true)] 
    LOCAL PROCEDURE OnAfterPostPurchaseDoc(VAR PurchaseHeader : Record 38;VAR GenJnlPostLine : Codeunit 12;PurchRcpHdrNo : Code[20];RetShptHdrNo : Code[20];PurchInvHdrNo : Code[20];PurchCrMemoHdrNo : Code[20]);  
    VAR
      PurchRcptHeader : Record 120;
      PurchRcptLine : Record 121;
      IncidentMgt : Codeunit 50101;
      
    BEGIN        
      IF PurchRcpHdrNo <> '' THEN BEGIN
        PurchRcptHeader.SETRANGE("No.",PurchRcpHdrNo);
        IF PurchRcptHeader.FINDFIRST THEN BEGIN
          PurchRcptLine.SETRANGE("Document No.",PurchRcptHeader."No.");
          PurchRcptLine.SETFILTER(Quantity,'<>0');
          IF PurchRcptLine.FINDSET THEN REPEAT
            IncidentMgt.CreateIncidentEnry(PurchRcptLine);
          UNTIL PurchRcptLine.NEXT = 0;
        END;
      END;
    END;

    [EventSubscriber(ObjectType::Codeunit, codeunit::"N154 Incident Mgt.", 'OnAfterFillSourceDetails','', true, true)] 
    local procedure OnAfterFillSourceDetails(var IncidentEntry: record "N154 Incident Entry";EventHandled:Boolean);
    var
      SourceRecRef:RecordRef; 
      PurchRcpt: TextConst ENU='PurchRcpt';     

    begin
        if EventHandled then
            exit;
        IF SourceRecRef.GET(IncidentEntry."Source Record ID") THEN BEGIN
            if SourceRecRef.Number = DATABASE::"Purch. Rcpt. Line" then begin
              IncidentEntry."Incident Area" := PurchRcpt;  
            end;
        end;          

    end;

}