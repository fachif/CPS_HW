within CourseExamples.Workshop10;
model Rotating_Inertia
  Modelica.Mechanics.Rotational.Components.Inertia inertia(
    J=1,
    w(fixed=true, start=1),
    a(fixed=true, start=0))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Rotating_Inertia;
