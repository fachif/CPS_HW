within CourseExamples.Workshop9.MultiBody;
model TestLinkage_step19
  Linkage linkage(lowerInnerJoint(w(start=0), a(start=0)))
    annotation (Placement(transformation(extent={{-8,-12},{16,8}})));
  inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,-1})
    annotation (Placement(transformation(extent={{68,74},{88,94}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r=linkage.r_5)
    annotation (Placement(transformation(extent={{-86,12},{-66,32}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1
    annotation (Placement(transformation(extent={{-86,-40},{-66,-20}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(m=10)
    annotation (Placement(transformation(extent={{54,-12},{74,8}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(useAxisFlange=true, n=
       {0,1,0})
    annotation (Placement(transformation(extent={{-48,12},{-28,32}})));
  Modelica.Mechanics.Translational.Sources.Position position(useSupport=true,
      exact=true)
    annotation (Placement(transformation(extent={{-54,54},{-34,74}})));
  Modelica.Blocks.Sources.Sine sine(amplitude=0.1)
    annotation (Placement(transformation(extent={{-90,54},{-70,74}})));
equation
  connect(fixed1.frame_b, linkage.mountFrame) annotation (Line(
      points={{-66,-30},{-14,-30},{-14,-3},{-8,-3}},
      color={95,95,95},
      thickness=0.5));
  connect(linkage.uprightFrame, body.frame_a) annotation (Line(
      points={{16,-2},{54,-2}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic.frame_a, fixed.frame_b) annotation (Line(
      points={{-48,22},{-66,22}},
      color={95,95,95},
      thickness=0.5));
  connect(prismatic.frame_b, linkage.steerFrame) annotation (Line(
      points={{-28,22},{-18,22},{-18,3.8},{-8.2,3.8}},
      color={95,95,95},
      thickness=0.5));
  connect(position.flange, prismatic.axis)
    annotation (Line(points={{-34,64},{-30,64},{-30,28}}, color={0,127,0}));
  connect(sine.y, position.s_ref)
    annotation (Line(points={{-69,64},{-56,64}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TestLinkage_step19;
