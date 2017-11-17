codeunit 50100 "N154 Subscribers"
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
      
    BEGIN
        Message('piet');
      IF PurchRcpHdrNo <> '' THEN BEGIN
        PurchRcptHeader.SETRANGE("No.",PurchRcpHdrNo);
        IF PurchRcptHeader.FINDFIRST THEN BEGIN
          PurchRcptLine.SETRANGE("Document No.",PurchRcptHeader."No.");
          PurchRcptLine.SETFILTER(Quantity,'<>0');
          IF PurchRcptLine.FINDSET THEN REPEAT
            Message('piet');
            //IncidentMgmt.CreateIncidentEntry(PurchRcptLine);
          UNTIL PurchRcptLine.NEXT = 0;
        END;
      END;
    END;
}