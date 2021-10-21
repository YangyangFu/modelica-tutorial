within Tutorial.MultiPhysicsModels.ElectricalExamples;
model RLC2 "A low pass RLC filter using graphical editor"

  parameter Modelica.SIunits.Inductance L=1 "Inductance";
  parameter Modelica.SIunits.Resistance R=100 "Resistance at temperature T_ref";
  parameter Modelica.SIunits.Voltage Vb=24 "Value of constant voltage";
  parameter Modelica.SIunits.Capacitance C=1e-03 "Capacitance";

  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor(R=R) "A resistor"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={60,0})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=C) "A capacitor"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,0})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage battery(V=Vb) annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,0})));
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-70,-50},{-50,-30}})));

equation
  connect(resistor.n, battery.p) annotation (Line(points={{60,-10},{60,-30},{-60,
          -30},{-60,-10}}, color={0,0,255}));
  connect(capacitor.n, battery.p) annotation (Line(points={{0,-10},{0,-30},{-60,
          -30},{-60,-10}}, color={0,0,255}));
  connect(battery.p, ground.p)
    annotation (Line(points={{-60,-10},{-60,-30}}, color={0,0,255}));
  connect(battery.n, inductor.p)
    annotation (Line(points={{-60,10},{-60,40},{-40,40}}, color={0,0,255}));
  connect(capacitor.p, inductor.n)
    annotation (Line(points={{0,10},{0,40},{-20,40}}, color={0,0,255}));
  connect(inductor.n, resistor.p)
    annotation (Line(points={{-20,40},{60,40},{60,10}}, color={0,0,255}));
  annotation (experiment(StartTime=0,
                StopTime=2,
                __Dymola_Algorithm="Dassl"));
end RLC2;
