within CourseExamples.Workshop11.Interfaces;
partial model Transmission
  Modelica.Mechanics.Rotational.Interfaces.Flange_a driveline_flange
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a engine_flange
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Transmission;
