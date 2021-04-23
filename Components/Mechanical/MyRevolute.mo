within CourseExamples.Components.Mechanical;
model MyRevolute
  Modelica.Mechanics.Rotational.Components.Damper damper(d=d)
    annotation (Placement(transformation(extent={{-48,40},{-28,60}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(
    useAxisFlange=true,
    n=n,
    phi(fixed=true),
    w(fixed=true))
    annotation (Placement(transformation(extent={{-48,0},{-28,20}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a annotation (Placement(
        transformation(rotation=0, extent={{-110,-70},{-90,-50}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b annotation (Placement(
        transformation(rotation=0, extent={{90,-70},{110,-50}})));
  parameter Modelica.SIunits.RotationalDampingConstant d=0.1 "Damping constant";
  parameter Modelica.Mechanics.MultiBody.Types.Axis n={0,0,1}
    "Axis of rotation resolved in frame_a (= same as in frame_b)";
equation
  connect(damper.flange_b, revolute1.axis) annotation (Line(points={{-28,50},{
          -24,50},{-24,28},{-38,28},{-38,20}}));
  connect(revolute1.support, damper.flange_a) annotation (Line(points={{-44,20},
          {-44,28},{-58,28},{-58,50},{-48,50}}));
  connect(frame_a, revolute1.frame_a) annotation (Line(points={{-100,-60},{-74,
          -60},{-74,10},{-48,10}}, color={95,95,95}));
  connect(frame_b, revolute1.frame_b) annotation (Line(points={{100,-60},{36,
          -60},{36,10},{-28,10}}, color={95,95,95}));
end MyRevolute;
