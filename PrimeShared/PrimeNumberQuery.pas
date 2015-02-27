﻿namespace PrimeQuery;

interface

type
  PrimeNumberQuery = public class
  protected
    method GetAsString: String;
    method SetAsString(NumStr: String);
  public
    const HighestSupportedNumber = 4000000000000; // 4 trillion
    class method IsPrime(const TestNumber: UInt64): Boolean;
    method IsPrime: Boolean;
    property Number: UInt64 read write;
    property AsString: String read GetAsString write SetAsString;
    event NumberChanged: EventHandler;
  public invariants
    Number <= HighestSupportedNumber;
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
    method DoOnFoundPrimeEvent;
  public
    property MinNumber: UInt64;
    property MaxNumber: UInt64;
    property StartTime: DateTime;
    property StopTime: DateTime;
    property Count: UInt32 read PrimeCount;
    constructor;
    method Generate;
    method ElapsedTime: TimeSpan;    
    event OnFoundPrime: EventHandler;
  public invariants
    MaxNumber <= HighestSupportedNumber;
    MinNumber < MaxNumber;
  end;

implementation

{$REGION PrimeNumberQuery}

class method PrimeNumberQuery.IsPrime(const TestNumber: UInt64): Boolean;
var 
  max: UInt64 := UInt64(Math.Round(Math.Sqrt(Double(TestNumber))));
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
  Result := Number.ToString;
end;

method PrimeNumberQuery.SetAsString(NumStr: String);
var
  NewNum: UInt64;
begin
  UInt64.TryParse(NumStr, out NewNum);

  if NewNum <> Number then begin
    Number := NewNum;
    
    if assigned(NumberChanged) then
      NumberChanged(self, EventArgs.Empty);
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
  if Number.ToString.Length > 1 then
    SetAsString(Number.ToString.Substring(0, Number.ToString.Length - 1).ToString)
  else
    Number := 0;
end;

method PrimeNumberEdit.AddDigit(NewDigit: UInt64);
begin
  if Number > 0 then
    SetAsString(Number.ToString + NewDigit.ToString)
  else
    Number := NewDigit;
end;

method PrimeNumberEdit.AddDigit(NewDigit: String);
begin
  if Number > 0 then
    SetAsString(Number.ToString + NewDigit)
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
  StartTime := DateTime.MinValue;
  StopTime := DateTime.MinValue;
end;

method PrimeNumberList.Generate;
begin
  Number := MinNumber;
  StartTime := DateTime.Now;
  PrimeCount := 0;

  repeat
    if IsPrime then 
      DoOnFoundPrimeEvent;

    Number := Number + 1;
  until Number > MaxNumber;

  StopTime := DateTime.Now;
end;

method PrimeNumberList.DoOnFoundPrimeEvent;
begin
  inc(PrimeCount);

  if assigned(OnFoundPrime) then
    OnFoundPrime(self, EventArgs.Empty);
end;

method PrimeNumberList.ElapsedTime: TimeSpan;
begin
  result := StopTime.Subtract(StartTime);
end;

{$ENDREGION}

end.
