within CourseExamples.Workshop9.MultiBody;
model TestLinkage_step17
  Linkage linkage(lowerInnerJoint(
      phi(start=0),
      w(start=0, fixed=true),
      a(start=0, fixed=true)))
    annotation (Placement(transformation(extent={{-8,-12},{16,8}})));
  inner Modelica.Mechanics.MultiBody.World world(n(displayUnit="1") = {0,0,-1})
    annotation (Placement(transformation(extent={{-96,74},{-76,94}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r=linkage.r_5)
    annotation (Placement(transformation(extent={{-86,12},{-66,32}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed1
    annotation (Placement(transformation(extent={{-86,-40},{-66,-20}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(m=10)
    annotation (Placement(transformation(extent={{54,-12},{74,8}})));
equation
  connect(fixed1.frame_b, linkage.mountFrame) annotation (Line(
      points={{-66,-30},{-14,-30},{-14,-3},{-8,-3}},
      color={95,95,95},
      thickness=0.5));
  connect(fixed.frame_b, linkage.steerFrame) annotation (Line(
      points={{-66,22},{-14,22},{-14,3.8},{-8.2,3.8}},
      color={95,95,95},
      thickness=0.5));
  connect(linkage.uprightFrame, body.frame_a) annotation (Line(
      points={{16,-2},{54,-2}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TestLinkage_step17;
