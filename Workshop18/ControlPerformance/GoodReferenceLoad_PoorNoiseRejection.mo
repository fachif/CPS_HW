within CourseExamples.Workshop18.ControlPerformance;
model GoodReferenceLoad_PoorNoiseRejection
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=1)
    annotation (Placement(transformation(extent={{52,-4},{72,16}})));
  Modelica.Blocks.Sources.Step step(startTime=5)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Math.Gain gain(k=100)
    annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{20,-4},{40,16}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod=0.002, sigma=0.05)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.Sources.Step step1(startTime=1)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{72,-40},{92,-20}})));
equation
  connect(step1.y, feedback.u1)
    annotation (Line(points={{-59,0},{-48,0}}, color={0,0,127}));
  connect(feedback.y, gain.u)
    annotation (Line(points={{-31,0},{-18,0}}, color={0,0,127}));
  connect(gain.y, add.u2)
    annotation (Line(points={{5,0},{18,0}}, color={0,0,127}));
  connect(step.y, add.u1) annotation (Line(points={{-19,30},{8,30},{8,12},{18,
          12}}, color={0,0,127}));
  connect(add.y, firstOrder.u)
    annotation (Line(points={{41,6},{50,6}}, color={0,0,127}));
  connect(firstOrder.y, add1.u2) annotation (Line(points={{73,6},{80,6},{80,-14},
          {56,-14},{56,-36},{70,-36}}, color={0,0,127}));
  connect(normalNoise.y, add1.u1) annotation (Line(points={{61,70},{92,70},{92,
          -16},{64,-16},{64,-24},{70,-24}}, color={0,0,127}));
  connect(add1.y, feedback.u2) annotation (Line(points={{93,-30},{96,-30},{96,
          -60},{-40,-60},{-40,-8}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end GoodReferenceLoad_PoorNoiseRejection;
