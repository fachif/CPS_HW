within CourseExamples.Workshop13.Hammer;
model TestThermostatLogic
  Modelica.Blocks.Sources.ExpSine expSine(
    amplitude=40,
    freqHz=1,
    damping=0.5,
    offset=300)
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  ThermostatLogicSign thermostatLogicSign
    annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
equation
  connect(expSine.y, thermostatLogicSign.u)
    annotation (Line(points={{-37,0},{-18,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TestThermostatLogic;
