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
    method Test0;
    method Test1;
    method Test2;
    method Test3;
    method Test4;
    method Test5;
    method Test6;
    method Test7;
    method Test8;
    method Test13;
    method Test17;
    method Test999999999999997;
    method Test999999999999998;
    method Test999999999999999;
    method Test1000000000000000;
    method TestSet10;
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

method PrimeQueryTestClass.TestCheck;
begin
  Assert.IsFalse(FPrimeNumQry.IsPrime(8));
  Assert.IsTrue(FPrimeNumQry.IsPrime(17));
end;

method PrimeQueryTestClass.Test0;
begin
(*
  try
    Assert.IsFalse(FPrimeNumQry.IsPrime(0));
    raise new AssertException('calling IsPrime with less than 2 should raise an error');
  except
    
  end;
*)
end;

method PrimeQueryTestClass.Test1;
begin
(*
  try
    Assert.IsFalse(FPrimeNumQry.IsPrime(1));
    raise new AssertException('calling IsPrime with less than 2 should raise an error');
  except

  end;
*)
end;

method PrimeQueryTestClass.Test5;
begin
  Assert.IsTrue(FPrimeNumQry.IsPrime(5));
end;

method PrimeQueryTestClass.Test6;
begin
  Assert.IsFalse(FPrimeNumQry.IsPrime(6));
end;

method PrimeQueryTestClass.Test7;
begin
  Assert.IsTrue(FPrimeNumQry.IsPrime(7));
end;

method PrimeQueryTestClass.Test8;
begin
  Assert.IsFalse(FPrimeNumQry.IsPrime(8));
end;

method PrimeQueryTestClass.Test999999999999997;
begin
  Assert.IsFalse(FPrimeNumQry.IsPrime(999999999999997));
end;

method PrimeQueryTestClass.Test999999999999998;
begin
  Assert.IsFalse(FPrimeNumQry.IsPrime(999999999999998));
end;

method PrimeQueryTestClass.Test999999999999999;
begin
  Assert.IsFalse(FPrimeNumQry.IsPrime(999999999999999));
end;

method PrimeQueryTestClass.Test1000000000000000;
begin
  Assert.IsFalse(FPrimeNumQry.IsPrime(1000000000000000));
end;

end.
