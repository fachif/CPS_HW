within CourseExamples.Experiments;
model ControlledMotor
  Components.Electrical.ElectricalMotor electricalMotor(ratio=2, J=1)
    annotation (Placement(transformation(extent={{0,-20},{40,20}})));
  Modelica.Blocks.Sources.Constant const
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J=1)
    annotation (Placement(transformation(extent={{60,-20},{80,0}})));
equation
  connect(const.y, electricalMotor.v1) annotation (Line(points={{-39,10},{-20,
          10},{-20,18},{-2,18}}, color={0,0,127}));
  connect(electricalMotor.flange_b1, inertia.flange_a) annotation (Line(points=
          {{42.8,-11.2},{51.4,-11.2},{51.4,-10},{60,-10}}, color={0,0,0}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ControlledMotor;
