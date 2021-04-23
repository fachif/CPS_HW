within CourseExamples.Workshop6;
model DegreesofFreedom1
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c=1, d=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=1)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
equation
  connect(inertia.flange_b, springDamper.flange_a)
    annotation (Line(points={{-40,0},{-10,0}}, color={0,0,0}));
  connect(springDamper.flange_b, inertia1.flange_a)
    annotation (Line(points={{10,0},{40,0}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end DegreesofFreedom1;
