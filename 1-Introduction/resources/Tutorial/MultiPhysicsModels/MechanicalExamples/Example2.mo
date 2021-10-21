within Tutorial.MultiPhysicsModels.MechanicalExamples;
model Example2 "A mechanical example"
  extends Modelica.Icons.Example;

  parameter Modelica.SIunits.Inertia J1=0.4 "Moment of inertia";
  parameter Modelica.SIunits.Inertia J2=1 "Moment of inertia";
  parameter Modelica.SIunits.RotationalDampingConstant d1=0.2
    "Damping constant";
  parameter Modelica.SIunits.RotationalDampingConstant d2=1 "Damping constant";
  parameter Modelica.SIunits.RotationalSpringConstant c1=11 "Spring constant";

  parameter Modelica.SIunits.RotationalSpringConstant c2=5 "Spring constant";

  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=J1)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper1(d=d1)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Mechanics.Rotational.Components.Spring spring1(c=c1)
    annotation (Placement(transformation(extent={{-60,-40},{-40,-20}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J=J2, phi(
      start=1,
      displayUnit="rad",
      fixed=true))
    annotation (Placement(transformation(extent={{-6,-10},{14,10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper2(d=d2)
    annotation (Placement(transformation(extent={{30,20},{50,40}})));
  Modelica.Mechanics.Rotational.Components.Spring spring2(c=c2)
    annotation (Placement(transformation(extent={{30,-40},{50,-20}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={90,0})));

  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor1
    annotation (Placement(transformation(extent={{-36,20},{-16,40}})));
  Modelica.Mechanics.Rotational.Sensors.TorqueSensor torqueSensor2
    annotation (Placement(transformation(extent={{56,20},{76,40}})));
equation
  connect(inertia1.flange_b, damper1.flange_a) annotation (Line(points={{-80,0},
          {-68,0},{-68,30},{-60,30}}, color={0,0,0}));
  connect(inertia1.flange_b, spring1.flange_a) annotation (Line(points={{-80,0},
          {-68,0},{-68,-30},{-60,-30}}, color={0,0,0}));
  connect(spring1.flange_b, inertia2.flange_a) annotation (Line(points={{-40,-30},
          {-12,-30},{-12,0},{-6,0}},  color={0,0,0}));
  connect(inertia2.flange_b, damper2.flange_a)
    annotation (Line(points={{14,0},{20,0},{20,30},{30,30}},color={0,0,0}));
  connect(inertia2.flange_b, spring2.flange_a)
    annotation (Line(points={{14,0},{20,0},{20,-30},{30,-30}},color={0,0,0}));
  connect(spring2.flange_b, fixed.flange)
    annotation (Line(points={{50,-30},{80,-30},{80,0},{90,0}}, color={0,0,0}));
  connect(damper1.flange_b, torqueSensor1.flange_a)
    annotation (Line(points={{-40,30},{-36,30}}, color={0,0,0}));
  connect(inertia2.flange_a, torqueSensor1.flange_b) annotation (Line(points={{-6,
          0},{-12,0},{-12,30},{-16,30}}, color={0,0,0}));
  connect(damper2.flange_b, torqueSensor2.flange_a)
    annotation (Line(points={{50,30},{56,30}}, color={0,0,0}));
  connect(torqueSensor2.flange_b, fixed.flange)
    annotation (Line(points={{76,30},{80,30},{80,0},{90,0}}, color={0,0,0}));
  annotation (
    experiment(StopTime=5, __Dymola_Algorithm="Dassl"));
end Example2;
