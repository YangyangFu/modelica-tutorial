within Tutorial.HelloWorld;
model helloworld "A simple ODE"
  Real x;

initial equation
  x = 1;
equation
  der(x) = -x;
  annotation (
    experiment(StopTime=10, __Dymola_Algorithm="Dassl"));
end helloworld;
