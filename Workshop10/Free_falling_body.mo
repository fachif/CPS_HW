within CourseExamples.Workshop10;
model Free_falling_body
  inner Modelica.Mechanics.MultiBody.World world
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Modelica.Mechanics.MultiBody.Parts.Body body(
    r_CM={0,0,0},
    m=1,
    r_0(fixed=true),
    v_0(fixed=true),
    angles_fixed=true,
    angles_start={0,1.5707963267949,0},
    w_0_fixed=true,
    w_0_start={0,0,1},
    useQuaternions=false)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end Free_falling_body;
