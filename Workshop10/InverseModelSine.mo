within CourseExamples.Workshop10;
model InverseModelSine
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{-38,28},{-16,50}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia
    annotation (Placement(transformation(extent={{-10,28},{10,48}})));
  Modelica.Blocks.Math.InverseBlockConstraints inverseBlockConstraints
    annotation (Placement(transformation(
        extent={{-56,-55},{56,55}},
        rotation=180,
        origin={-4,39})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor
    annotation (Placement(transformation(extent={{10,62},{30,82}})));
  Modelica.Blocks.Sources.Sine sine
    annotation (Placement(transformation(extent={{60,74},{80,94}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque1
    annotation (Placement(transformation(extent={{-36,-76},{-14,-54}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1
    annotation (Placement(transformation(extent={{-8,-76},{12,-56}})));
  Modelica.Mechanics.Rotational.Sensors.AngleSensor angleSensor1
    annotation (Placement(transformation(extent={{24,-76},{44,-56}})));
  Modelica.Blocks.Sources.Sine sine1(amplitude=40)
    annotation (Placement(transformation(extent={{-72,-74},{-52,-54}})));
equation
  connect(torque.tau, inverseBlockConstraints.y2)
    annotation (Line(points={{-40.2,39},{-51.6,39}}, color={0,0,127}));
  connect(inertia.flange_a, torque.flange) annotation (Line(points={{-10,38},{
          -14,38},{-14,39},{-16,39}}, color={0,0,0}));
  connect(inertia.flange_b, angleSensor.flange)
    annotation (Line(points={{10,38},{10,72}}, color={0,0,0}));
  connect(angleSensor.phi, inverseBlockConstraints.u2) annotation (Line(points=
          {{31,72},{34,72},{34,39},{40.8,39}}, color={0,0,127}));
  connect(sine.y, inverseBlockConstraints.u1) annotation (Line(points={{81,84},
          {84,84},{84,39},{57.6,39}}, color={0,0,127}));
  connect(angleSensor1.flange, inertia1.flange_b)
    annotation (Line(points={{24,-66},{12,-66}}, color={0,0,0}));
  connect(torque1.flange, inertia1.flange_a) annotation (Line(points={{-14,-65},
          {-11,-65},{-11,-66},{-8,-66}}, color={0,0,0}));
  connect(sine1.y, torque1.tau) annotation (Line(points={{-51,-64},{-44,-64},{
          -44,-65},{-38.2,-65}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end InverseModelSine;
