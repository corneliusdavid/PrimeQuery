namespace PrimeQueryTest;

interface

uses
  RemObjects.Elements.EUnit,
  PrimeQuery;

type
  PrimeListTestClass = public class(Test)
  private
    FPrimeNumLst: PrimeNumberList;
    method TestRange(TestMin, TestMax: UInt64);
    method HandlePrimeFound(sender: System.Object; aEventArgs: EventArgs);
  public
    method Setup; override;
    method Test1to2;
    method Test1to3;
    method Test2to3;
    method Test2to8;
    method Test1to10;
    method Test0to10;
    method Test4to10;
    method Test1to100;
    method Test100to200;
    method Test1to10000;
    method Test10to1;
  end;

implementation

method PrimeListTestClass.Setup;
begin
  FPrimeNumLst := new PrimeNumberList;
end;

method PrimeListTestClass.HandlePrimeFound(sender: Object; aEventArgs: EventArgs);
begin
  if FPrimeNumLst.Count > 1 then
    Console.Write(', ');
  Console.Write(FPrimeNumLst.Number);
end;

method PrimeListTestClass.TestRange(TestMin, TestMax: UInt64);
begin
  FPrimeNumLst.MinNumber := TestMin;
  FPrimeNumLst.MaxNumber := TestMax;
  FPrimeNumLst.OnFoundPrime += @HandlePrimeFound;
  FPrimeNumLst.Generate;

  Console.WriteLine('; {0} total primes in {1} seconds.', 
              [FPrimeNumLst.Count, FPrimeNumLst.ElapsedSeconds])
end;

method PrimeListTestClass.Test1to100;
begin
  TestRange(1, 100);
  Assert.AreEqual(FPrimeNumLst.Count, 25);
end;

method PrimeListTestClass.Test100to200;
begin
  TestRange(100, 200);
  Assert.AreEqual(FPrimeNumLst.Count, 21);
end;

method PrimeListTestClass.Test1to10000;
begin
  TestRange(1, 10000);
  Assert.AreEqual(FPrimeNumLst.Count, 1229);
end;

method PrimeListTestClass.Test1to2;
begin
  TestRange(1, 2);
  Assert.AreEqual(FPrimeNumLst.Count, 1);
end;

method PrimeListTestClass.Test1to3;
begin
  TestRange(1, 3);
  Assert.AreEqual(FPrimeNumLst.Count, 2);
end;

method PrimeListTestClass.Test2to3;
begin
  TestRange(2, 3);
  Assert.AreEqual(FPrimeNumLst.Count, 2);
end;

method PrimeListTestClass.Test2to8;
begin
  TestRange(2, 8);
  Assert.AreEqual(FPrimeNumLst.Count, 4);
end;

method PrimeListTestClass.Test1to10;
begin
  TestRange(1, 10);
  Assert.AreEqual(FPrimeNumLst.Count, 4);
end;

method PrimeListTestClass.Test0to10;
begin
  TestRange(0, 10);
  Assert.AreEqual(FPrimeNumLst.Count, 4);
end;

method PrimeListTestClass.Test4to10;
begin
  TestRange(4, 10);
  Assert.AreEqual(FPrimeNumLst.Count, 2);
end;

method PrimeListTestClass.Test10to1;
begin
  Assert.Throws(method begin TestRange(10, 1); end, typeOf(Exception));
end;

end.
