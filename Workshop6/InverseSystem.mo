within CourseExamples.Workshop6;
model InverseSystem
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=0.1)
    annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
  Modelica.Mechanics.Rotational.Components.SpringDamper springDamper(c=10, d=
        0.1) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Sources.ExpSine expSine(freqHz=2, damping=0.5)
    annotation (Placement(transformation(extent={{34,-48},{54,-28}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
    annotation (Placement(transformation(extent={{6,-50},{-34,-26}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J=1)
    annotation (Placement(transformation(extent={{26,-10},{46,10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(inertia1.flange_b, angleSensor.flange)
    annotation (Line(points={{46,0},{60,0}}, color={0,0,0}));
  connect(springDamper.flange_b, inertia1.flange_a)
    annotation (Line(points={{10,0},{26,0}}, color={0,0,0}));
  connect(inertia.flange_b, springDamper.flange_a)
    annotation (Line(points={{-28,0},{-10,0}}, color={0,0,0}));
  connect(torque.flange, inertia.flange_a)
    annotation (Line(points={{-60,0},{-48,0}}, color={0,0,0}));
  connect(inverseBlockConstraints.y2, torque.tau) annotation (Line(points={{-31,
          -38},{-30,-38},{-30,-20},{-90,-20},{-90,0},{-82,0}}, color={0,0,127}));
  connect(inverseBlockConstraints.u2, angleSensor.phi) annotation (Line(points=
          {{2,-38},{-4,-38},{-4,-18},{34,-18},{34,-14},{88,-14},{88,0},{81,0}},
        color={0,0,127}));
  connect(inverseBlockConstraints.u1, expSine.y) annotation (Line(points={{8,
          -38},{24,-38},{24,-60},{70,-60},{70,-38},{55,-38}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end InverseSystem;
