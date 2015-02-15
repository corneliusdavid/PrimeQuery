namespace PrimeQuery;

interface

type
  PrimeNumberQuery = public class
  protected
    method GetAsString: String;
    method SetAsString(NumStr: String);
  public
    class method IsPrime(const TestNumber: UInt64): Boolean;
    method Check: Boolean;
    property Number: UInt64 read write;
    property AsString: String read GetAsString write SetAsString;
  public invariants
    Number < 4000000000000;
  end;

  PrimeNumberEdit = public class(PrimeNumberQuery)
  public
    method Clear;
    method AddDigit(const NewDigit: UInt64);
    method Backspace;
    method IncNumber;
    method DecNumber;
  end;

implementation

{ PrimeNumberQuery }

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

method PrimeNumberQuery.Check: Boolean;
begin
  Result := IsPrime(Number);
end;

method PrimeNumberQuery.GetAsString: String;
begin
  Result := Number.ToString;
end;

method PrimeNumberQuery.SetAsString(NumStr: String);
begin
  UInt64.TryParse(NumStr, out Number);
end;

{ PrimeNumberEdit }

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

method PrimeNumberEdit.IncNumber;
begin
  Number := Number + 1;
end;

method PrimeNumberEdit.DecNumber;
begin
  if Number > 0 then
    Number := Number - 1;
end;

end.
