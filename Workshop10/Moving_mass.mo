within CourseExamples.Workshop10;
model Moving_mass
  Modelica.Mechanics.Translational.Components.Mass mass
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Mechanics.Translational.Sources.Position position(useSupport=false,
      exact=true)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  Sigmoidal sigmoidal(
    K=10,
    start_delay=5,
    A=1) annotation (Placement(transformation(extent={{-96,-36},{-24,36}})));
equation
  connect(position.flange, mass.flange_a)
    annotation (Line(points={{20,0},{40,0}}, color={0,127,0}));
  connect(sigmoidal.y, position.s_ref)
    annotation (Line(points={{-21.12,0},{-2,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Moving_mass;
