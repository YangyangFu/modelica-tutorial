within ;
model test
  parameter String tunableParameterFile=Modelica.Utilities.Files.loadResource("tunable-parameter.txt")
    annotation(Evaluate=false);
  parameter String initialStatesFile=Modelica.Utilities.Files.loadResource("initial-states.txt")
    annotation(Evaluate=false);
  parameter String nextStatesFile=Modelica.Utilities.Files.loadResource("next-states.txt")
    annotation(Evaluate=false);
  parameter Real a(fixed=false);
  parameter Real y0(fixed=false);
  Real y;
  Real nextStates[1];

initial algorithm
  //remove existing files to avoid overwritting errors
  if (nextStatesFile <> "") then
    Modelica.Utilities.Files.removeFile(nextStatesFile);
  end if;
  //read tunable parameters
  a := Modelica.Utilities.Examples.readRealParameter(tunableParameterFile,"a");
  y0 := Modelica.Utilities.Examples.readRealParameter(initialStatesFile,"ini1");

initial equation
  y = y0;

algorithm
  when terminal() then
    for i in 1:scalar(size(nextStates)) loop
      Modelica.Utilities.Streams.print("ini"+integerString(number=i,minimumWidth=1)+"  =  "+realString(number=nextStates[i],minimumWidth=1),nextStatesFile);
    end for;
  end when;

equation
  nextStates[1] =y;
  der(y) =a;
end test;
