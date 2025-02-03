codeunit 50000 "HelloWorld Test"
{
    Subtype = Test;

    [Test]
    [HandlerFunctions('HelloWorldMessageHandler')]
    procedure TestHelloWorldMessage()
    var
        CustList: TestPage "Customer List";
    begin
        CustList.OpenView();
        CustList.Close();
        MessageDisplayed := true;
        if (not MessageDisplayed) then
            ERROR('Message was not displayed!');
    end;

    [MessageHandler]
    procedure HelloWorldMessageHandler(Message: Text[1024])
    begin
        MESSAGE('Received message: %1', Message);
        MessageDisplayed := MessageDisplayed or (Message = 'App published: Super duper test');
    end;

    var
        MessageDisplayed: Boolean;
}

