within CourseExamples.Workshop6;
model SuspendedMass
  extends MassInGravityField(mass(r_CM={Modelica.Constants.eps,Modelica.Constants.eps,
          Modelica.Constants.eps}));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r={Modelica.Constants.eps,
        Modelica.Constants.eps,Modelica.Constants.eps}) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={0,40})));
  Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel springDamperParallel(
    c=25,
    d=1,
    s_small=Modelica.Constants.eps) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,8})));
equation
  connect(springDamperParallel.frame_b, fixed.frame_b) annotation (Line(
      points={{0,18},{0,30}},
      color={95,95,95},
      thickness=0.5));
  connect(mass.frame_a, springDamperParallel.frame_a) annotation (Line(
      points={{40,0},{32,0},{32,-20},{0,-20},{0,-2}},
      color={95,95,95},
      thickness=0.5));
end SuspendedMass;
