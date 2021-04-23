within CourseExamples.Workshop6;
model MassWithForce2
  extends MassInGravityField;
  Modelica.Blocks.Sources.RealExpression realExpression[3](y=f)
    annotation (Placement(transformation(extent={{-82,-10},{-62,10}})));
  Modelica.Mechanics.MultiBody.Forces.WorldForce force
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
    Modelica.SIunits.Force[3] f;
equation
  mass.frame_a.r_0 = {sin(time),0.1*time,cos(time)};
  connect(force.frame_b, mass.frame_a) annotation (Line(
      points={{0,0},{40,0}},
      color={95,95,95},
      thickness=0.5));
  connect(realExpression.y, force.force)
    annotation (Line(points={{-61,0},{-22,0}}, color={0,0,127}));
end MassWithForce2;
