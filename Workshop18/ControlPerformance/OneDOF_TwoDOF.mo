within CourseExamples.Workshop18.ControlPerformance;
model OneDOF_TwoDOF
  Modelica.Blocks.Continuous.FirstOrder firstOrder(T=1)
    annotation (Placement(transformation(extent={{52,-4},{72,16}})));
  Modelica.Blocks.Sources.Step step(startTime=5)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{20,-4},{40,16}})));
  inner Modelica.Blocks.Noise.GlobalSeed globalSeed
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Noise.NormalNoise normalNoise(samplePeriod=0.002, sigma=0)
    annotation (Placement(transformation(extent={{40,60},{60,80}})));
  Modelica.Blocks.Sources.Step step1(startTime=1)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{72,-40},{92,-20}})));
  Modelica.Blocks.Nonlinear.FixedDelay fixedDelay(delayTime=0.4)
    annotation (Placement(transformation(extent={{34,-40},{54,-20}})));
  Modelica.Blocks.Continuous.LimPID PID(
    k=4.75,
    Ti=0.48,
    Td=0.084,
    yMax=100,
    wp=0.6,
    wd=0.6) annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
equation
  connect(step.y, add.u1) annotation (Line(points={{-19,30},{8,30},{8,12},{18,
          12}}, color={0,0,127}));
  connect(add.y, firstOrder.u)
    annotation (Line(points={{41,6},{50,6}}, color={0,0,127}));
  connect(normalNoise.y, add1.u1) annotation (Line(points={{61,70},{92,70},{92,
          -16},{64,-16},{64,-24},{70,-24}}, color={0,0,127}));
  connect(firstOrder.y, fixedDelay.u) annotation (Line(points={{73,6},{80,6},{
          80,-12},{22,-12},{22,-30},{32,-30}}, color={0,0,127}));
  connect(fixedDelay.y, add1.u2) annotation (Line(points={{55,-30},{62,-30},{62,
          -36},{70,-36}}, color={0,0,127}));
  connect(step1.y, PID.u_s)
    annotation (Line(points={{-59,0},{-50,0}}, color={0,0,127}));
  connect(add1.y, PID.u_m) annotation (Line(points={{93,-30},{98,-30},{98,-66},
          {-38,-66},{-38,-12}}, color={0,0,127}));
  connect(PID.y, add.u2)
    annotation (Line(points={{-27,0},{18,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end OneDOF_TwoDOF;
