within ;
model test
    parameter Real a = 1 "a";
    Real y;
  equation
  der(y) = a;
end test;
