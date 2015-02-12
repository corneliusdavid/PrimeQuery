namespace PrimeQuery;

interface


type
  MenuAction = enum (maTestPrime, maListPrimes, maExit);

  ConsoleApp = class
  public
    const LastPrime = 10000;
    class method ConsoleMenu: MenuAction;
    class method ListPrimes;
    class method TestPrime;
    class method Main(args: array of String);
  end;

implementation

class method ConsoleApp.ConsoleMenu: MenuAction;
var  
  cmd: String;
begin
  Console.WriteLine;
  Console.WriteLine('- Prime Query - ');
  Console.WriteLine('"E"xit,  "T"est a Number for Primality, "L"ist Prime Numbers less than {0}', LastPrime);
  Console.Write('Enter Command: ');

  cmd := Console.ReadLine;
  case cmd.Substring(0, 1).ToUpper of
    'E': result := MenuAction.maExit;
    'T': result := MenuAction.maTestPrime;
    'L': result := MenuAction.maListPrimes;
  end;
end;

class method ConsoleApp.ListPrimes;
begin
  Console.WriteLine('Prime Numbers');
  for i: Integer := 1 to LastPrime do
    if PrimeNumberQuery.IsPrime(i) then begin
      if i > 2 then
        Console.Write(', ');
      Console.Write(i.ToString);
    end;
end;

class method ConsoleApp.TestPrime;
var  
  num: Integer;
begin
  Console.Write('Enter a number: ');
  Integer.TryParse(Console.ReadLine, out num);
  if PrimeNumberQuery.IsPrime(num) then
    Console.WriteLine('{0} IS A PRIME!', [num])
  else
    Console.WriteLine('{0} is not a prime.', [num]);
end;

class method ConsoleApp.Main(args: array of String);
begin
  var done := false;
  repeat
    case ConsoleMenu of
      MenuAction.maExit:
        done := True;
      MenuAction.maTestPrime:
        TestPrime;
      MenuAction.maListPrimes:
        ListPrimes;
    end;
  until done;
end;

end.
