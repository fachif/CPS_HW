within CourseExamples.Workshop11.Interfaces;
partial model Engine
  Modelica.Blocks.Interfaces.RealInput throttle
    annotation (Placement(transformation(extent={{-130,-20},{-90,20}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a transmission_flange
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Engine;
