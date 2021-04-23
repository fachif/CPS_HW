within CourseExamples.Workshop9.MultiBody;
model Linkage

  parameter Modelica.SIunits.Position[3] r_1 = {0,0,0.2} "Upper Inner Joint";
  parameter Modelica.SIunits.Position[3] r_2 = {0,0.4,0.2} "Upper Outer Joint";
  parameter Modelica.SIunits.Position[3] r_3 = {0,0,-0.1} "Lower Inner Joint";
  parameter Modelica.SIunits.Position[3] r_4 = {0,0.4,-0.1} "Lower Outer Joint";
  parameter Modelica.SIunits.Position[3] r_5 = {-0.1,0,0} "Steer Inner Joint";
  parameter Modelica.SIunits.Position[3] r_6 = {-0.1,0.4,0} "Upper Outer Joint";
  parameter Modelica.SIunits.Position[3] r_7 = {0,0.3,0.3} "Spring Upper Joint";
  parameter Modelica.SIunits.Position[3] r_8 = {0,0.3,-0.1} "Spring Lower Joint";
  parameter Modelica.SIunits.TranslationalDampingConstant d = 2000 "Damping Constant";
  parameter Modelica.SIunits.TranslationalSpringConstant c = 20000 "Spring Constant";
  parameter Modelica.SIunits.Length s = 0.35 "Unstretched spring length";

  Modelica.Mechanics.MultiBody.Interfaces.Frame_a steerFrame
    annotation (Placement(transformation(extent={{-138,42},{-106,74}}),
        iconTransformation(extent={{-138,42},{-106,74}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_a mountFrame
    annotation (Placement(transformation(extent={{-136,-26},{-104,6}}),
        iconTransformation(extent={{-136,-26},{-104,6}})));
  Modelica.Mechanics.MultiBody.Interfaces.Frame_b uprightFrame
    annotation (Placement(transformation(extent={{104,-16},{136,16}}),
        iconTransformation(extent={{104,-16},{136,16}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute upperInnerJoint(n={1,0,0})
    annotation (Placement(transformation(extent={{-44,10},{-24,30}})));
  Modelica.Mechanics.MultiBody.Joints.SphericalSpherical steerLink(rodLength=
        Modelica.Math.Vectors.length(r_6 - r_5))
    annotation (Placement(transformation(extent={{-26,48},{-6,68}})));
  Modelica.Mechanics.MultiBody.Joints.Spherical lowerOuterJoint
    annotation (Placement(transformation(extent={{20,-50},{40,-30}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation steerLever(r=r_6 - r_4)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={80,22})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r=r_1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,20})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r=r_3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-96,-40})));
  Modelica.Mechanics.MultiBody.Joints.Revolute lowerInnerJoint(
    n={1,0,0},
    phi(start=0),
    w(start=0),
    a(start=0))
    annotation (Placement(transformation(extent={{-74,-50},{-54,-30}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation lowerArm(r=r_4 - r_3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-2,-40})));
  Modelica.Mechanics.MultiBody.Joints.Spherical upperOuterJoint
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation upperArm(r=r_2 - r_1)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-4,20})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation kingPin(r=r_2 - r_4)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,10})));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamperParallel(
    c=c,
    s_unstretched=s,
    d=d)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={18,-10})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation toUpperSpring(r=r_7)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-32,0})));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation toLowerSpring(r=r_8 - r_3)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,-20})));
equation
  connect(steerLink.frame_a, steerFrame) annotation (Line(
      points={{-26,58},{-122,58}},
      color={95,95,95},
      thickness=0.5));
  connect(steerLink.frame_b, steerLever.frame_b) annotation (Line(
      points={{-6,58},{80,58},{80,32}},
      color={95,95,95},
      thickness=0.5));
  connect(steerLever.frame_a, uprightFrame) annotation (Line(
      points={{80,12},{80,0},{120,0}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation1.frame_b, upperInnerJoint.frame_a) annotation (Line(
      points={{-60,20},{-44,20}},
      color={95,95,95},
      thickness=0.5));
  connect(fixedTranslation1.frame_a, mountFrame) annotation (Line(
      points={{-80,20},{-120,20},{-120,-10}},
      color={95,95,95},
      thickness=0.5));

  connect(fixedTranslation2.frame_a, mountFrame) annotation (Line(
      points={{-106,-40},{-120,-40},{-120,-10}},
      color={95,95,95},
      thickness=0.5));
  connect(lowerInnerJoint.frame_a, fixedTranslation2.frame_b) annotation (Line(
      points={{-74,-40},{-86,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(lowerArm.frame_a, lowerInnerJoint.frame_b) annotation (Line(
      points={{-12,-40},{-54,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(lowerArm.frame_b, lowerOuterJoint.frame_a) annotation (Line(
      points={{8,-40},{20,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(upperArm.frame_a, upperInnerJoint.frame_b) annotation (Line(
      points={{-14,20},{-24,20}},
      color={95,95,95},
      thickness=0.5));
  connect(upperArm.frame_b, upperOuterJoint.frame_a) annotation (Line(
      points={{6,20},{20,20}},
      color={95,95,95},
      thickness=0.5));
  connect(upperOuterJoint.frame_b, kingPin.frame_b) annotation (Line(
      points={{40,20},{60,20}},
      color={95,95,95},
      thickness=0.5));
  connect(kingPin.frame_a, uprightFrame) annotation (Line(
      points={{60,0},{120,0}},
      color={95,95,95},
      thickness=0.5));
  connect(lowerOuterJoint.frame_b, kingPin.frame_a) annotation (Line(
      points={{40,-40},{60,-40},{60,0}},
      color={95,95,95},
      thickness=0.5));
  connect(steerFrame, steerFrame) annotation (Line(
      points={{-122,58},{-104,58},{-104,58},{-122,58}},
      color={95,95,95},
      thickness=0.5));
  connect(toUpperSpring.frame_a, mountFrame) annotation (Line(
      points={{-42,0},{-120,0},{-120,-10}},
      color={95,95,95},
      thickness=0.5));
  connect(toUpperSpring.frame_b, springDamperParallel.frame_a) annotation (Line(
      points={{-22,0},{18,0}},
      color={95,95,95},
      thickness=0.5));
  connect(toLowerSpring.frame_a, lowerInnerJoint.frame_b) annotation (Line(
      points={{-40,-20},{-40,-40},{-54,-40}},
      color={95,95,95},
      thickness=0.5));
  connect(toLowerSpring.frame_b, springDamperParallel.frame_b) annotation (Line(
      points={{-20,-20},{18,-20}},
      color={95,95,95},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},
            {120,100}}), graphics={Rectangle(extent={{-120,100},{120,-100}},
            lineColor={28,108,200}), Text(
          extent={{-64,30},{60,-24}},
          lineColor={28,108,200},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-120,-100},{120,100}})));
end Linkage;
