within CourseExamples.Workshop6;
partial model MassInGravityField
  inner Modelica.Mechanics.MultiBody.World world
    annotation (Placement(transformation(extent={{-54,54},{-34,74}})));
  Modelica.Mechanics.MultiBody.Parts.Body mass(m=1)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end MassInGravityField;
