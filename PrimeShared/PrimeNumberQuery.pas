namespace PrimeQuery;

interface

{$IFNDEF WINDOWS_PHONE}
uses
  Sugar;
{$ENDIF}

type
  PrimeNumberQuery = public class
  private
    FNumber: UInt64;
    method SetNumber(NewNum: UInt64);
  protected
    method GetAsString: String;
    method SetAsString(NumStr: String);
  public
    const HighestSupportedNumber = 4000000000000; // 4 trillion
    class method IsPrime(const TestNumber: UInt64): Boolean;
    method IsPrime: Boolean;
    property Number: UInt64 read FNumber write SetNumber;
    property AsString: String read GetAsString write SetAsString;
    {$IFDEF COOPER}
    method DoNumberChangedEvent;
    property OnNumberChanged: block;
    {$ELSE}
    event OnNumberChanged: EventHandler protected raise;
    {$ENDIF}
    constructor;
  public invariants
    Number <= HighestSupportedNumber:
      {$IF COOPER}
      'Maximum value handled by this application is ' + HighestSupportedNumber.toString;
      {$ELSE}
      'Maximum value handled by this application is ' + HighestSupportedNumber.ToString;
      {$ENDIF}
  end;

  PrimeNumberEdit = public class(PrimeNumberQuery)
  public
    method Clear;
    method AddDigit(const NewDigit: UInt64);
    method AddDigit(const NewDigit: String);
    method Backspace;
    method IncNumber;
    method DecNumber;
  end;

  PrimeNumberList = public class(PrimeNumberQuery)
  private
    PrimeCount: UInt32;
    {$IFNDEF COOPER}
    method DoFoundPrimeEvent;
    {$ENDIF}
  public
    property MinNumber: UInt64;
    property MaxNumber: UInt64;
    property StartTime: DateTime;
    property StopTime: DateTime;
    property Count: UInt32 read PrimeCount;
    constructor;
    method Generate;
    method ElapsedSeconds: Integer;    
    {$IF COOPER}
    method DoFoundPrimeEvent;
    property OnFoundPrime: block;
    {$ELSE}
    event OnFoundPrime: EventHandler;
    {$ENDIF}
  public invariants
    { invariants are only for debugging as they raise Assertion exceptions }
    MaxNumber <= HighestSupportedNumber: 
    {$IF COOPER}
      'Maximum value handled by this application is ' + HighestSupportedNumber.toString;
    {$ELSE}
      'Maximum value handled by this application is ' + HighestSupportedNumber.ToString;
    {$ENDIF}
    // MinNumber < MaxNumber: 'The number specified for the minimum must be less than the maximum number.';
  end;

implementation

{$REGION PrimeNumberQuery}

class method PrimeNumberQuery.IsPrime(const TestNumber: UInt64): Boolean;
var 
  max := UInt64(Math.Round(Math.Sqrt(Double(TestNumber))));
begin
  // handle 2 and 3, false for numbers less than 2
  if TestNumber <= 3 then
    Result := TestNumber > 1

  // handle multiples of 2 and 3
  else if (TestNumber mod 2 = 0) or (TestNumber mod 3 = 0) then
    Result := False
  else begin
    Result := True;
    for i: Integer := 5 to max step 6 do
      if (TestNumber mod i = 0) or (TestNumber mod (i + 2) = 0) then begin
        Result := False;
        Break;
      end;
  end;
end;

method PrimeNumberQuery.IsPrime: Boolean;
begin
  Result := IsPrime(Number);
end;

method PrimeNumberQuery.GetAsString: String;
begin
  {$IF COOPER}
  Result := Number.toString;
  {$ELSE}
  Result := Number.ToString;
  {$ENDIF}
end;

method PrimeNumberQuery.SetAsString(NumStr: String);
var
  NewNum: UInt64;
begin
  {$IF CLR}
  UInt64.TryParse(NumStr, out NewNum);
  {$ELSE}
  UInt64.parseLong(NumStr, NewNum);
  {$ENDIF}

  if NewNum <> Number then begin
    Number := NewNum;
    
    if assigned(OnNumberChanged) then
      {$IF COOPER}
      DoNumberChangedEvent;
      {$ELSE}
      OnNumberChanged(self, EventArgs.Empty);
      {$ENDIF}
  end;
end;

constructor PrimeNumberQuery;
begin
  Number := 1;
end;

{$IF COOPER}
method PrimeNumberQuery.DoNumberChangedEvent;
begin
  if OnNumberChanged <> nil then
    DoNumberChangedEvent;
end;
{$ENDIF}

method PrimeNumberQuery.SetNumber(NewNum: UInt64);
begin
  if NewNum <> FNumber then begin
    FNumber := NewNum;

    if assigned(OnNumberChanged) then
      {$IF COOPER}
      DoNumberChangedEvent;
      {$ELSE}
      OnNumberChanged(self, EventArgs.Empty);
      {$ENDIF}
  end;
end;
{$ENDREGION}

{$REGION PrimeNumberEdit }

method PrimeNumberEdit.Clear;
begin
  Number := 0;
end;

method PrimeNumberEdit.Backspace;
begin
  {$IF COOPER}
  if Number.toString.length > 1 then
    SetAsString(Number.toString.substring(0, Number.toString.length - 1).toString)
  {$ELSE}
  if Number.ToString.Length > 1 then
    SetAsString(Number.ToString.Substring(0, Number.ToString.Length - 1).ToString)
  {$ENDIF}
  else
    Number := 0;
end;

method PrimeNumberEdit.AddDigit(NewDigit: UInt64);
begin
  if Number > 0 then
    {$IF COOPER}
    SetAsString(Number.toString + NewDigit.toString)
    {$ELSE}
    SetAsString(Number.ToString + NewDigit.ToString)
    {$ENDIF}
  else
    Number := NewDigit;
end;

method PrimeNumberEdit.AddDigit(NewDigit: String);
begin
  if Number > 0 then
    {$IF COOPER}
    SetAsString(Number.toString + NewDigit)
    {$ELSE}
    SetAsString(Number.ToString + NewDigit)
    {$ENDIF}
  else
    SetAsString(NewDigit);
end;

method PrimeNumberEdit.IncNumber;
begin
  Number := Number + 1;
end;

method PrimeNumberEdit.DecNumber;
begin
  if Number > 0 then
    Number := Number - 1;
end;
{$ENDREGION}

{$REGION PrimeNumberList}
constructor PrimeNumberList;
begin
  MinNumber := 1;
  MaxNumber := HighestSupportedNumber;
  Number := MinNumber;
  PrimeCount := 0;

  // initialize with minimum start/stop times
  StartTime := new DateTime(1900, 1, 1);
  StopTime := new DateTime(1900, 1, 1);
end;

method PrimeNumberList.Generate;
{ require clauses are only for debugging as they raise Assertion exceptions 
require
  MaxNumber > MinNumber;
}
begin
  if MinNumber > MaxNumber then
    raise new Exception('The MaxNumber of the range must be greater than MinNumber.');

  Number := MinNumber;
  StartTime := DateTime.Now;
  PrimeCount := 0;

  repeat
    if IsPrime then 
      DoFoundPrimeEvent;

    Number := Number + 1;
  until Number > MaxNumber;

  StopTime := DateTime.Now;
end;

method PrimeNumberList.DoFoundPrimeEvent;
begin
  inc(PrimeCount);

  if assigned(OnFoundPrime) then
    {$IF COOPER}
    DoFoundPrimeEvent;
    {$ELSE}
    OnFoundPrime(self, EventArgs.Empty);
    {$ENDIF}
end;

method PrimeNumberList.ElapsedSeconds: Integer;
begin
  result := StopTime.Second - StartTime.Second;
end;

{$ENDREGION}

end.
