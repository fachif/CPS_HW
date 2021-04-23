within CourseExamples.Workshop8.Coil.Experiments;
model StrokeTest
  Components.Stroke stroke annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-6})));
  Modelica.Mechanics.Translational.Components.Fixed fixed annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-20})));
  Modelica.Mechanics.Translational.Components.Mass mass(m=0.01, v(start=1))
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,18})));
equation
  connect(stroke.mount, fixed.flange) annotation (Line(points={{0,-10},{0,-14},
          {0,-14},{0,-20}}, color={0,127,0}));
  connect(stroke.flange, mass.flange_a)
    annotation (Line(points={{0,0},{0,8},{0,8}}, color={0,127,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end StrokeTest;
