within Tutorial.MultiPhysicsModels.MotorDriveControlExample;
partial model MotorRotation "Motor drive control example"
  extends Modelica.Icons.Example;

  Modelica.Mechanics.Rotational.Components.IdealGear gearbox(ratio=100)
                      annotation (Placement(
        transformation(extent={{10,0},{30,20}},   rotation=0)));
  Modelica.Mechanics.Rotational.Components.Inertia load(J=10)
                            annotation (Placement(
        transformation(extent={{40,0},{60,20}},   rotation=0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation (
      Placement(transformation(
        origin={80,10},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Motor.DCMotor motor(
    R=0.5,
    L=0.05,
    k=1,
    J=0.001)
           annotation (Placement(transformation(extent={{-20,0},{0,20}})));

equation
  connect(load.flange_b, speedSensor.flange)
    annotation (Line(points={{60,10},{70,10}}, color={0,0,0}));
  connect(gearbox.flange_b, load.flange_a)
    annotation (Line(points={{30,10},{40,10}}, color={0,0,0}));
  connect(motor.flange, gearbox.flange_a)
    annotation (Line(points={{0,10},{10,10}}, color={0,0,0}));
  annotation (Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{120,100}})),
    experiment(StopTime=1200, __Dymola_Algorithm="Dassl"),
    Icon(coordinateSystem(extent={{-140,-100},{120,100}})));
end MotorRotation;
