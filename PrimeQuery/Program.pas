namespace PrimeQuery;

interface


type
  ConsoleApp = class
  public
    class method Main(args: array of String);
  end;

implementation


class method ConsoleApp.Main(args: array of String);
var
  i: Integer;
begin
  Console.WriteLine('Prime Numbers');
  for i := 1 to 2000 do
    if PrimeNumberQuery.IsPrime(i) then begin
      if i > 2 then
        Console.Write(', ');
      Console.Write(i.ToString);
    end;

  Console.ReadLine;
end;

end.
