within CourseExamples.Workshop6;
model DegreesofFreedom4
  Modelica.Mechanics.Rotational.Components.Fixed fixed
    annotation (Placement(transformation(extent={{-50,-6},{-30,14}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed1
    annotation (Placement(transformation(extent={{30,-6},{50,14}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
equation
  connect(fixed.flange, springDamper.flange_a)
    annotation (Line(points={{-40,4},{-40,20},{-10,20}}, color={0,0,0}));
  connect(springDamper.flange_b, fixed1.flange)
    annotation (Line(points={{10,20},{40,20},{40,4}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DegreesofFreedom4;
