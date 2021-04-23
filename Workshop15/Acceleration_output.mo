within CourseExamples.Workshop15;
model Acceleration_output
  Modelica.Blocks.Sources.Sine sineACC(freqHz=1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Interfaces.RealOutput a_ref_input
    "Connector of Real output signal"
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(sineACC.y, a_ref_input)
    annotation (Line(points={{-39,0},{50,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Acceleration_output;
