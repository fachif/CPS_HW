within CourseExamples.Workshop10;
model InverseModelStep
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
  Modelica.Blocks.Sources.Step step(startTime=1)
    annotation (Placement(transformation(extent={{60,74},{80,94}})));
equation
  connect(torque.tau, inverseBlockConstraints.y2)
    annotation (Line(points={{-40.2,39},{-51.6,39}}, color={0,0,127}));
  connect(inertia.flange_a, torque.flange) annotation (Line(points={{-10,38},{
          -14,38},{-14,39},{-16,39}}, color={0,0,0}));
  connect(inertia.flange_b, angleSensor.flange)
    annotation (Line(points={{10,38},{10,72}}, color={0,0,0}));
  connect(angleSensor.phi, inverseBlockConstraints.u2) annotation (Line(points=
          {{31,72},{34,72},{34,39},{40.8,39}}, color={0,0,127}));
  connect(step.y, inverseBlockConstraints.u1) annotation (Line(points={{81,84},
          {84,84},{84,39},{57.6,39}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -40},{100,100}})), Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-40},{100,100}})));
end InverseModelStep;
