within Tutorial.SimpleDAEs;
model SimpleDAE
  "A simple DAE system for illustrating Modelica and acausal modeling"
  Real x(start=1) "variable x";
  Real y "variable y";

equation
  2*der(x) = 1 - y;
  x^2 - y^2 = 1;
  annotation (experiment(
    StartTime=0,
    StopTime=10,
    __Dymola_Algorithm="Dassl"));
end SimpleDAE;
