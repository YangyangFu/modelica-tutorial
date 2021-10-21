within Tutorial.MultiPhysicsModels.ElectricalExamples;
model RLC2WithSensors "A low pass RLC filter using graphical editor"

  parameter Modelica.SIunits.Inductance L=1 "Inductance";
  parameter Modelica.SIunits.Resistance R=100 "Resistance at temperature T_ref";
  parameter Modelica.SIunits.Voltage Vb=24 "Value of constant voltage";
  parameter Modelica.SIunits.Capacitance C=1e-03 "Capacitance";

  Modelica.Electrical.Analog.Sensors.CurrentSensor i_L "Current sensor"
                                                                 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,26})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor i_C "Current sensor"
                                                                 annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,26})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor V annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={30,0})));

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

  Modelica.Electrical.Analog.Sensors.CurrentSensor i_R "Current sensor"
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={60,26})));
equation
  connect(resistor.n, battery.p) annotation (Line(points={{60,-10},{60,-30},{-60,
          -30},{-60,-10}}, color={0,0,255}));
  connect(capacitor.n, battery.p) annotation (Line(points={{0,-10},{0,-30},{-60,
          -30},{-60,-10}}, color={0,0,255}));
  connect(battery.p, ground.p)
    annotation (Line(points={{-60,-10},{-60,-30}}, color={0,0,255}));
  connect(battery.n, i_L.p)
    annotation (Line(points={{-60,10},{-60,16}}, color={0,0,255}));
  connect(i_L.n, inductor.p)
    annotation (Line(points={{-60,36},{-60,40},{-40,40}}, color={0,0,255}));
  connect(inductor.n, i_C.p)
    annotation (Line(points={{-20,40},{0,40},{0,36}}, color={0,0,255}));
  connect(i_C.n, capacitor.p)
    annotation (Line(points={{0,16},{0,10}}, color={0,0,255}));
  connect(V.n, inductor.n)
    annotation (Line(points={{30,10},{30,40},{-20,40}}, color={0,0,255}));
  connect(V.p, resistor.n) annotation (Line(points={{30,-10},{30,-30},{60,-30},{
          60,-10}}, color={0,0,255}));
  connect(inductor.n, i_R.p)
    annotation (Line(points={{-20,40},{60,40},{60,36}}, color={0,0,255}));
  connect(i_R.n, resistor.p)
    annotation (Line(points={{60,16},{60,10}}, color={0,0,255}));
  annotation (experiment(StartTime=0,
                StopTime=2,
                __Dymola_Algorithm="Dassl"));
end RLC2WithSensors;
