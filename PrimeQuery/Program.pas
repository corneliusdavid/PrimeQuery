namespace PrimeQuery;

interface


type
  MenuAction = enum (maInvalid, maTestPrime, maListPrimes, maExit);

  ConsoleApp = class 
  private
    class method OnPrimeFound(sender: System.Object; aEventArgs: EventArgs);
  public
    const MaxLastPrime = PrimeNumberQuery.HighestSupportedNumber;
    class method ConsoleMenu: MenuAction;
    class method ListPrimes;
    class method ListPrimes(LastNumber: UInt64);
    class method TestPrime;
    class method MainLoop;
    class method Main(args: array of String);
  end;

implementation

class method ConsoleApp.ConsoleMenu: MenuAction;
var  
  cmd: String;
begin
  Console.WriteLine;
  Console.WriteLine('- Prime Query - ');
  Console.WriteLine('X - eXit');
  Console.WriteLine('T - Test a number for primality');
  Console.WriteLine('L - List prime numbers less than {0}', MaxLastPrime);
  Console.Write('Enter Command: ');

  cmd := Console.ReadLine;
  Console.WriteLine;
  Console.WriteLine('> ' + cmd);
  Console.WriteLine;
  case cmd.Substring(0, 1).ToUpper of
    'X': result := MenuAction.maExit;
    'T': result := MenuAction.maTestPrime;
    'L': result := MenuAction.maListPrimes;
    else result := MenuAction.maInvalid;
  end;
end;

class method ConsoleApp.ListPrimes;
var  
  StartNum, EndNum: UInt64;
  PrimeNumLst: PrimeNumberList;
begin
  PrimeNumLst := new PrimeNumberList;

  Console.Write('Enter starting number: ');
  UInt64.TryParse(Console.ReadLine, out StartNum);
  Console.Write('Enter ending number: ');
  UInt64.TryParse(Console.ReadLine, out EndNum);

  PrimeNumLst.MinNumber := StartNum;
  PrimeNumLst.MaxNumber := EndNum;
  PrimeNumLst.OnFoundPrime += @OnPrimeFound;
  PrimeNumLst.Generate;

  Console.WriteLine;
  Console.WriteLine('{0} total primes in {1} seconds.', 
              [PrimeNumLst.Count, PrimeNumLst.ElapsedTime.TotalSeconds]);
end;

class method ConsoleApp.ListPrimes(LastNumber: UInt64);
var  
  PrimeNumLst: PrimeNumberList;
begin
  PrimeNumLst := new PrimeNumberList;
  PrimeNumLst.MinNumber := 1;
  PrimeNumLst.MaxNumber := LastNumber;
  PrimeNumLst.OnFoundPrime += @OnPrimeFound;
  PrimeNumLst.Generate;

  Console.WriteLine('{0} total primes in {1} seconds.', 
              [PrimeNumLst.Count, PrimeNumLst.ElapsedTime.TotalSeconds]);
end;

class method ConsoleApp.TestPrime;
var  
  num: UInt64;
begin
  Console.Write('Enter a number: ');
  UInt64.TryParse(Console.ReadLine, out num);
  if PrimeNumberQuery.IsPrime(num) then
    Console.WriteLine('{0} IS A PRIME!', [num])
  else
    Console.WriteLine('{0} is not a prime.', [num]);
end;

class method ConsoleApp.Main(args: array of String);
const 
  CRLF = #13#10;
  ProgramHelp = 'PrimeQuery Console - a simple program to test the primality of a number,' + CRLF +
                '  or to list all primes up to a certain number.' + CRLF +
                'If started with /? then this help message is listed.' + CRLF +
                'If started with /list 123 then all primes up to 123 are listed' + CRLF +
                '  (replace 123 with any positive number up to 4 trillion).';
var 
  LastPrime: UInt64;
begin
  if length(args) > 0 then begin
    for i: Integer := 0 to length(args) - 1 do
      if args[i].Equals('/?') then 
        Console.WriteLine(ProgramHelp)
      else if (args[i].Equals('/list', StringComparison.OrdinalIgnoreCase)) and (length(args) > i) then begin
        UInt64.TryParse(args[i+1], out LastPrime);
        ListPrimes(LastPrime);
        break;
      end else
        Console.WriteLine('Invalid Parameter: ' + args[i]);
  end else       
    MainLoop;
end;

class method ConsoleApp.MainLoop;
var 
  done := false;
begin
  repeat
    case ConsoleMenu of
      MenuAction.maExit:
        done := True;
      MenuAction.maTestPrime:
        TestPrime;
      MenuAction.maListPrimes:
        ListPrimes;
      MenuAction.maInvalid:
        Console.WriteLine('Invalid command');
    end;
  until done;
end;

class method ConsoleApp.OnPrimeFound(sender: Object; aEventArgs: EventArgs);
begin
  if (sender as PrimeNumberList).Count > 1 then
    Console.Write(', ');
  Console.Write((sender as PrimeNumberList).Number);
end;

end.
