within Tutorial.MultiPhysicsModels.ThermalExamples;
model Example2 "A thermal system"
  extends Modelica.Icons.Example;

  parameter Modelica.SIunits.HeatCapacity C=0.12
    "Heat capacity of element (= cp*m)";
  parameter Modelica.SIunits.Temperature T0=363.15 "Temperature of element";
  parameter Modelica.SIunits.Temperature T_inf=298.15
    "Fixed temperature at port";

  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor(C=C, T(
        start=T0))
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Thermal.HeatTransfer.Components.Convection convection
    annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=
        T_inf)
    annotation (Placement(transformation(extent={{40,-40},{20,-20}})));
  Modelica.Blocks.Sources.Constant h(k=0.7) "Convective cooling coefficient"
    annotation (Placement(transformation(extent={{-80,50},{-60,70}})));
  Modelica.Blocks.Sources.Constant A(k=1.0) "Sureface area"
    annotation (Placement(transformation(extent={{-80,10},{-60,30}})));
  Modelica.Blocks.Math.Product hA
    annotation (Placement(transformation(extent={{-40,30},{-20,50}})));

equation
  connect(heatCapacitor.port, convection.solid)
    annotation (Line(points={{-50,-30},{-20,-30}}, color={191,0,0}));
  connect(convection.fluid, fixedTemperature.port)
    annotation (Line(points={{0,-30},{20,-30}}, color={191,0,0}));
  connect(h.y, hA.u1) annotation (Line(points={{-59,60},{-52,60},{-52,46},{-42,46}},
        color={0,0,127}));
  connect(A.y, hA.u2) annotation (Line(points={{-59,20},{-52,20},{-52,34},{-42,34}},
        color={0,0,127}));
  connect(hA.y, convection.Gc)
    annotation (Line(points={{-19,40},{-10,40},{-10,-20}}, color={0,0,127}));

end Example2;
