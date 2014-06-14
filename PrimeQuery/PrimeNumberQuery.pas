namespace PrimeQuery;

interface

type
  PrimeNumberQuery = public class
  { might add more stuff later }
  public
    class method IsPrime(const TestNumber: Integer): Boolean;
  end;

implementation

class method PrimeNumberQuery.IsPrime(const TestNumber: Integer): Boolean;
var 
  i: Integer := 3;
  max: Integer := Integer(Math.Round(Math.Sqrt(Double(TestNumber))));
begin
  if TestNumber = 2 then
    Result := True
  else if (TestNumber < 2) or (TestNumber mod 2 = 0) then
    Result := False
  else begin
    Result := True;
    while i < max do
      if TestNumber mod i = 0 then begin
        Result := False;
        Break;
      end else
        i := i + 2;
  end;
end;

end.
