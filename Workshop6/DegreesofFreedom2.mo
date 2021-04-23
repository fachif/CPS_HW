within CourseExamples.Workshop6;
model DegreesofFreedom2
  Modelica.Mechanics.Rotational.Components.Inertia inertia
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
equation
  connect(inertia.flange_b, idealGear.flange_a)
    annotation (Line(points={{-30,0},{-10,0}}, color={0,0,0}));
  connect(idealGear.flange_b, inertia1.flange_a)
    annotation (Line(points={{10,0},{30,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DegreesofFreedom2;
