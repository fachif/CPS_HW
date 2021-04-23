within CourseExamples.Workshop8.Coil.Experiments;
model StrokeComparison
  Components.Stroke stroke
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  Components.Stroke2 stroke2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=180,
        origin={30,10})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01, v(start=1))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-30,38})));
  Modelica.Mechanics.Translational.Components.Mass mass2(m=0.01, v(start=1))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={30,36})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,-30})));
  Modelica.Mechanics.Translational.Components.Fixed fixed1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={30,-30})));
equation
  connect(mass.flange_a, stroke.flange)
    annotation (Line(points={{-30,28},{-30,16}}, color={0,127,0}));
  connect(fixed.flange, stroke.mount)
    annotation (Line(points={{-30,-30},{-30,6}}, color={0,127,0}));
  connect(stroke2.flange, fixed1.flange)
    annotation (Line(points={{30,4},{30,-30}}, color={0,127,0}));
  connect(stroke2.mount, mass2.flange_a)
    annotation (Line(points={{30,14},{30,26}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end StrokeComparison;
