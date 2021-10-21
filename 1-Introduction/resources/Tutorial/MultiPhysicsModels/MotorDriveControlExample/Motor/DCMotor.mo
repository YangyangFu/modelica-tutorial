within Tutorial.MultiPhysicsModels.MotorDriveControlExample.Motor;
model DCMotor
  parameter Modelica.SIunits.Resistance R "Resistance at temperature T_ref";
  parameter Modelica.SIunits.Inductance L "Inductance";
  parameter Modelica.SIunits.ElectricalTorqueConstant k
    "Transformation coefficient";
  parameter Modelica.SIunits.Inertia J "Moment of inertia";
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=J) annotation (
      Placement(transformation(extent={{60,-10},{80,10}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.SignalVoltage Vs annotation (Placement(
        transformation(
        origin={-28,0},
        extent={{10,-10},{-10,10}},
        rotation=90)));
  Modelica.Electrical.Analog.Basic.Ground G annotation (Placement(
        transformation(extent={{-38,-46},{-18,-26}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor Ra(R=R)   annotation (Placement(
        transformation(extent={{-20,20},{0,40}},   rotation=0)));
  Modelica.Electrical.Analog.Basic.Inductor La(L=L)    annotation (Placement(
        transformation(extent={{6,20},{26,40}},  rotation=0)));
  Modelica.Electrical.Analog.Basic.EMF emf(k=k)
   annotation (Placement(transformation(extent={{22,-10},{42,10}},rotation=0)));
  Modelica.Blocks.Interfaces.RealInput Vb
    "Voltage between pin p and n (= p.v - n.v) as input signal"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Flange"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));

equation
  connect(Ra.n,La. p) annotation (Line(points={{0,30},{6,30}}));
  connect(La.n,emf. p) annotation (Line(points={{26,30},{32,30},{32,10}}));
  connect(Ra.p,Vs. p)
    annotation (Line(points={{-20,30},{-28,30},{-28,10}}, color={0,0,255}));
  connect(G.p,Vs. n)
    annotation (Line(points={{-28,-26},{-28,-10}},
                                                 color={0,0,255}));
  connect(Vs.n,emf. n)
    annotation (Line(points={{-28,-10},{-28,-20},{32,-20},{32,-10}},
                                                             color={0,0,255}));
  connect(Vs.v, Vb)
    annotation (Line(points={{-40,0},{-120,0}}, color={0,0,127}));
  connect(emf.flange, inertia.flange_a)
    annotation (Line(points={{42,0},{60,0}}, color={0,0,0}));
  connect(inertia.flange_b, flange)
    annotation (Line(points={{80,0},{100,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-76,150},{72,110}},
          lineColor={0,128,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DCMotor;
