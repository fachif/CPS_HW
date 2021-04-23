within CourseExamples.Workshop5;
model SolarCollectTest
  SolarCollector solarCollector
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Blocks.Sources.Sine G(
    amplitude=1000,
    freqHz=1/86400,
    phase=-1.5707963267949)
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Blocks.Sources.Sine theta(
    amplitude=60,
    freqHz=1/86400,
    phase=1.5707963267949,
    offset=100)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  Modelica.Blocks.Math.UnitConversions.From_deg from_deg
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=
        288.15) annotation (Placement(transformation(extent={{60,-20},{40,0}})));
equation
  connect(theta.y, from_deg.u)
    annotation (Line(points={{-59,-50},{-42,-50}}, color={0,0,127}));
  connect(fixedTemperature.port, solarCollector.therm_con)
    annotation (Line(points={{40,-10},{20.6,-10}}, color={191,0,0}));
  connect(G.y, solarCollector.G) annotation (Line(points={{-39,10},{-14,10},{
          -14,-3},{-2,-3}}, color={0,0,127}));
  connect(from_deg.y, solarCollector.theta) annotation (Line(points={{-19,-50},
          {-14,-50},{-14,-17},{-2,-17}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end SolarCollectTest;
