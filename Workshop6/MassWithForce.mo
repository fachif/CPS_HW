within CourseExamples.Workshop6;
model MassWithForce
  extends MassInGravityField;
  Modelica.SIunits.Force[3] f;
  Modelica.Mechanics.MultiBody.Forces.Internal.BasicWorldForce force
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Sources.RealExpression realExpression[3](y=f)
    annotation (Placement(transformation(extent={{-82,-10},{-62,10}})));
equation
  mass.frame_a.r_0 = {sin(time),0.1*time, cos(time)};
  connect(force.frame_b, mass.frame_a) annotation (Line(
      points={{0,0},{40,0}},
      color={95,95,95},
      thickness=0.5));
  connect(force.force, realExpression.y)
    annotation (Line(points={{-22,0},{-61,0}}, color={0,0,127}));
end MassWithForce;
