within CourseExamples.Workshop18.ControlPerformance;
model GoodReference_PoorLoadRejection
  Modelica.Blocks.Sources.Step step(startTime=1)
    annotation (Placement(transformation(extent={{-94,-10},{-74,10}})));
  Modelica.Blocks.Sources.Step step1(startTime=20)
    annotation (Placement(transformation(extent={{-34,30},{-14,50}})));
  Modelica.Blocks.Continuous.PI PI(T=50)
    annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{26,-10},{46,10}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-54,-10},{-34,10}})));
  Modelica.Blocks.Continuous.TransferFunction transferFunction(b={1}, a={1,1.02,
        0.02}) annotation (Placement(transformation(extent={{62,-10},{82,10}})));
equation
  connect(step.y, feedback.u1)
    annotation (Line(points={{-73,0},{-52,0}}, color={0,0,127}));
  connect(feedback.y, PI.u)
    annotation (Line(points={{-35,0},{-16,0}}, color={0,0,127}));
  connect(PI.y, add.u2)
    annotation (Line(points={{7,0},{14,0},{14,-6},{24,-6}}, color={0,0,127}));
  connect(step1.y, add.u1) annotation (Line(points={{-13,40},{14,40},{14,6},{24,
          6}}, color={0,0,127}));
  connect(add.y, transferFunction.u)
    annotation (Line(points={{47,0},{60,0}}, color={0,0,127}));
  connect(transferFunction.y, feedback.u2) annotation (Line(points={{83,0},{90,
          0},{90,-32},{-44,-32},{-44,-8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GoodReference_PoorLoadRejection;
