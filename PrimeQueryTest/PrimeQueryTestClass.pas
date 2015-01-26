namespace PrimeQueryTest;

interface

uses
  RemObjects.Elements.EUnit,
  PrimeQuery;

type
  PrimeQueryTestClass = public class(Test)
  private
    FPrimeNumQry: PrimeNumberQuery;
  public
    method Setup; override;
    method Test2;
    method Test3;
    method Test4;
    method Test13;
    method Test17;
    method TestSet10;
    method TestClear;
    method TestBackspace;
    method TestCheck;
  end;

implementation

method PrimeQueryTestClass.Test2;
begin
  Assert.IsTrue(FPrimeNumQry.IsPrime(2));
end;

method PrimeQueryTestClass.Setup;
begin
  FPrimeNumQry := new PrimeNumberQuery;
end;

method PrimeQueryTestClass.Test3;
begin
  Assert.IsTrue(FPrimeNumQry.IsPrime(3));
end;

method PrimeQueryTestClass.Test4;
begin
  Assert.IsFalse(FPrimeNumQry.IsPrime(4));
end;

method PrimeQueryTestClass.Test13;
begin
  Assert.IsTrue(FPrimeNumQry.IsPrime(13));
end;

method PrimeQueryTestClass.Test17;
begin
  Assert.IsTrue(FPrimeNumQry.IsPrime(17));
end;

method PrimeQueryTestClass.TestSet10;
const
  TestNum = 10;
begin
  FPrimeNumQry.Number := TestNum;
  Assert.AreEqual(FPrimeNumQry.Number, TestNum);
end;

method PrimeQueryTestClass.TestClear;
begin
  FPrimeNumQry.Number := 37;
  FPrimeNumQry.Clear;
  Assert.AreEqual(FPrimeNumQry.Number, 0);
end;

method PrimeQueryTestClass.TestBackspace;
begin
  FPrimeNumQry.Number := 123;
  FPrimeNumQry.Backspace;
  Assert.AreEqual(FPrimeNumQry.Number, 12);
end;

method PrimeQueryTestClass.TestCheck;
begin
  Assert.IsFalse(FPrimeNumQry.IsPrime(8));
  Assert.IsTrue(FPrimeNumQry.IsPrime(17));
end;

end.
