within Tutorial.MultiPhysicsModels.MotorDriveControlExample;
model MotorRotationControl "Motor drive control example"
  extends Tutorial.MultiPhysicsModels.MotorDriveControlExample.MotorRotation;

  Modelica.Blocks.Sources.Step ref(
    height=1,
    offset=1,
    startTime=600)                 annotation (Placement(transformation(extent={{-120,0},
            {-100,20}},           rotation=0)));
  Modelica.Blocks.Math.Feedback error
    annotation (Placement(transformation(extent={{-90,0},{-70,20}})));
  Modelica.Blocks.Continuous.PID PID(
    k=1,
    Ti=0.5,
    Td=0.1)     annotation (Placement(transformation(extent={{-50,0},{-30,20}},
          rotation=0)));
equation
  connect(ref.y, error.u1)
    annotation (Line(points={{-99,10},{-88,10}}, color={0,0,127}));
  connect(error.y, PID.u)
    annotation (Line(points={{-71,10},{-52,10}}, color={0,0,127}));
  connect(PID.y, motor.Vb)
    annotation (Line(points={{-29,10},{-22,10}}, color={0,0,127}));
  connect(speedSensor.w, error.u2) annotation (Line(points={{91,10},{100,10},{
          100,-34},{-80,-34},{-80,2}}, color={0,0,127}));
  annotation (Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{120,100}})),
    experiment(StopTime=1200, __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})));
end MotorRotationControl;
