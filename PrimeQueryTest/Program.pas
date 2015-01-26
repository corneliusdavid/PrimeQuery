namespace PrimeQueryTest;

interface

uses
  RemObjects.Elements.EUnit;

implementation

begin
  var lTests := Discovery.DiscoverTests();
  Runner.RunTests(lTests) withListener(new ConsoleTestListener());
  Console.ReadLine();
end.
